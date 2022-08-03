import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/domain/entities/all_tasks_response/all_tasks_response_entity.dart';
import 'package:todo_app/src/domain/entities/task_response/task_response_entity.dart';

abstract class RemoteDatasource {
  Future<AllTasksResponseEntity> getAllTasks();
  Future<TaskResponseEntity> addTask({
    required TaskModel task,
    required int revision,
  });
  Future<TaskResponseEntity> deleteTask({
    required String id,
    required int revision,
  });

  Future<TaskResponseEntity> updateTask({
    required TaskModel task,
    required int revision,
  });

  Future<AllTasksResponseEntity> updateAllTasks({
    required List<TaskModel> tasks,
    required int revision,
  });
}
