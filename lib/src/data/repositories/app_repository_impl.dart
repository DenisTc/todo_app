import 'package:todo_app/src/data/datasource/local/local_datasource_impl.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/datasource/remote/remote_datasource_impl.dart';
import 'package:todo_app/src/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LocalDataSourceImpl _localDatasource;
  final RemoteDatasourceImpl _remoteDatasource;

  AppRepositoryImpl({
    required LocalDataSourceImpl localDatasource,
    required RemoteDatasourceImpl remoteDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<void> getAllTasks() async {
    final revision = await _localDatasource.getRevision();
    final hasOfflineData = await _localDatasource.getOfflineDataStatus();

    final result = await _remoteDatasource.getAllTasks();

    if (result.status == 'ok') {
      // Если на бэке более актуальная ривизия которой у нас нет, то
      // удаляем локальные данные и записываем актуальные с бэка
      if (revision != result.revision) {
        await _localDatasource.deleteAllTasks();

        _localDatasource.addTasks(result.list!);
        _localDatasource.saveRevision(result.revision!);
      }

      // Если ревизии равны, но на устройстве есть новые локальные данные, то
      // Отправляем на бэк список "дел" и в ответ получаем актуальный список
      if (revision == result.revision && hasOfflineData) {
        updateAllTasks();
      }
    }
  }

  @override
  Future<void> addTask(TaskModel task) async {
    _localDatasource.addTask(task);
    final revision = await _localDatasource.getRevision();

    final hasOfflineData = await checkOfflineData();

    if (!hasOfflineData) {
      final result = await _remoteDatasource.addTask(
        task: task,
        revision: revision,
      );

      if (result.status == 'ok') {
        _localDatasource.saveRevision(result.revision!);
      } else {
        _localDatasource.saveOfflineDataStatus(true);
      }
    }
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    await _localDatasource.deleteTask(task);
    final revision = await _localDatasource.getRevision();

    final hasOfflineData = await checkOfflineData();

    if (!hasOfflineData) {
      final result = await _remoteDatasource.deleteTask(
        id: task.id,
        revision: revision,
      );

      if (result.status == 'ok') {
        _localDatasource.saveRevision(result.revision!);
      } else {
        _localDatasource.saveOfflineDataStatus(true);
      }
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final revision = await _localDatasource.getRevision();
    _localDatasource.updateTask(task);

    final hasOfflineData = await checkOfflineData();

    if (!hasOfflineData) {
      final result = await _remoteDatasource.updateTask(
        task: task,
        revision: revision,
      );

      if (result.status == 'ok') {
        _localDatasource.saveRevision(result.revision!);
      } else {
        _localDatasource.saveOfflineDataStatus(true);
      }
    }
  }

  @override
  Future<void> updateAllTasks() async {
    final revision = await _localDatasource.getRevision();
    final tasks = await _localDatasource.getAllTasks();

    final result = await _remoteDatasource.updateAllTasks(
      tasks: tasks,
      revision: revision,
    );

    if (result.status == 'ok') {
      await _localDatasource.deleteAllTasks();

      _localDatasource.addTasks(result.list!);
      _localDatasource.saveRevision(result.revision!);
      _localDatasource.saveOfflineDataStatus(false);
    }
  }

  Future<bool> checkOfflineData() async {
    final hasOfflineData = await _localDatasource.getOfflineDataStatus();
    if (hasOfflineData) {
      updateAllTasks();
      return true;
    }

    return false;
  }
}
