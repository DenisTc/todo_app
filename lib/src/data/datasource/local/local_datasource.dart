import 'package:todo_app/src/data/datasource/local/models/task_model.dart';

abstract class LocalDataSource {
  Future<void> addTask(TaskModel task);
  Future<void> addTasks(List<TaskModel> tasks);
  Future<void> deleteTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteAllTasks();
  Future<List<TaskModel>> getAllTasks();

  Future<void> saveRevision(int revision);
  Future<int> getRevision();

  Future<void> saveOfflineDataStatus(bool status);
  Future<bool> getOfflineDataStatus();
}
