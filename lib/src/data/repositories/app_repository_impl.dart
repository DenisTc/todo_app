import 'package:todo_app/src/data/datasource/local/local_datasource_impl.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LocalDataSourceImpl localData;

  AppRepositoryImpl(this.localData);

  @override
  Future<void> addTask(TaskModel task) async {
    localData.addTask(task);
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    await localData.deleteTask(task);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    localData.updateTask(task);
  }
}
