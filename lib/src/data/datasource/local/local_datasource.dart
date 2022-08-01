import 'package:todo_app/src/data/datasource/local/models/task_model.dart';

abstract class LocalDataSource {
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
}
