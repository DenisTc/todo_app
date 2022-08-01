import 'package:todo_app/src/imports.dart';

abstract class AppRepository {
  Future<void> addTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
}
