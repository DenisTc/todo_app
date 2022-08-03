import 'package:todo_app/src/data/api/api.dart';
import 'package:todo_app/src/data/api/api_routes.dart';
import 'package:todo_app/src/data/datasource/remote/remote_datasource.dart';
import 'package:todo_app/src/domain/entities/all_tasks_response/all_tasks_response_entity.dart';
import 'package:todo_app/src/domain/entities/task_response/task_response_entity.dart';
import 'package:todo_app/src/imports.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final Api _api;

  RemoteDatasourceImpl(this._api);

  @override
  Future<AllTasksResponseEntity> getAllTasks() async {
    try {
      final response = await _api.client.get(ApiRoutes.list);

      return AllTasksResponseEntity.fromJson(response.data);
    } catch (e) {
      return const AllTasksResponseEntity(status: 'error');
    }
  }

  @override
  Future<TaskResponseEntity> addTask({
    required TaskModel task,
    required int revision,
  }) async {
    final data = {'status': 'ok', 'element': task.toJson()};
    final options = Options(headers: {'X-Last-Known-Revision': revision});

    try {
      final response = await _api.client.post(
        ApiRoutes.list,
        data: data,
        options: options,
      );

      return TaskResponseEntity.fromJson(response.data);
    } catch (e) {
      return const TaskResponseEntity(status: 'error');
    }
  }

  @override
  Future<TaskResponseEntity> deleteTask({
    required String id,
    required int revision,
  }) async {
    final options = Options(headers: {'X-Last-Known-Revision': revision});

    try {
      final response =
          await _api.client.delete('${ApiRoutes.list}/$id', options: options);

      return TaskResponseEntity.fromJson(response.data);
    } catch (e) {
      return const TaskResponseEntity(status: 'error');
    }
  }

  @override
  Future<TaskResponseEntity> updateTask({
    required TaskModel task,
    required int revision,
  }) async {
    final data = {'status': 'ok', 'element': task.toJson()};
    final options = Options(headers: {'X-Last-Known-Revision': revision});

    try {
      final response = await _api.client.put(
        '${ApiRoutes.list}/${task.id}',
        data: data,
        options: options,
      );

      return TaskResponseEntity.fromJson(response.data);
    } catch (e) {
      return const TaskResponseEntity(status: 'error');
    }
  }

  @override
  Future<AllTasksResponseEntity> updateAllTasks({
    required List<TaskModel> tasks,
    required int revision,
  }) async {
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    final data = {'status': 'ok', 'list': tasksJson};
    final options = Options(headers: {'X-Last-Known-Revision': revision});

    try {
      final response = await _api.client.patch(
        ApiRoutes.list,
        data: data,
        options: options,
      );
      return AllTasksResponseEntity.fromJson(response.data);
    } catch (e) {
      return const AllTasksResponseEntity(status: 'error');
    }
  }
}
