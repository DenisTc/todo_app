import 'package:todo_app/src/imports.dart';

abstract class AppRepository {
  Future<void> getAllTasks();
  Future<void> updateAllTasks();
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
}
