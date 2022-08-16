import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/data/datasource/local/local_datasource.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/storage/hive_db.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final Box<TaskModel> _boxTasks;
  final SharedPreferences _sharedPreferences;

  HiveDB hiveDB = HiveDB();

  LocalDataSourceImpl({
    required Box<TaskModel> boxTasks,
    required SharedPreferences sharedPreferences,
  })  : _boxTasks = boxTasks,
        _sharedPreferences = sharedPreferences;

  @override
  Future<void> addTask(TaskModel task) async {
    _boxTasks.add(task);
  }

  @override
  Future<void> addTasks(List<TaskModel> tasks) async {
    await _boxTasks.addAll(tasks);
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    final taskToDelete =
        _boxTasks.values.firstWhere((boxTask) => boxTask.id == task.id);

    await taskToDelete.delete();
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final key =
        _boxTasks.values.firstWhere((boxTask) => boxTask.id == task.id).key;

    _boxTasks.put(key, task);
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final tasks = _boxTasks.values.toList();
    return tasks;
  }

  @override
  Future<void> deleteAllTasks() async {
    await _boxTasks.clear();
  }

  @override
  Future<void> saveRevision(int revision) async {
    await _sharedPreferences.setInt('revision', revision);
  }

  @override
  Future<int> getRevision() async {
    return _sharedPreferences.getInt('revision') ?? 0;
  }

  @override
  Future<void> saveOfflineDataStatus(bool status) async {
    await _sharedPreferences.setBool('hasOfflineData', status);
  }

  @override
  Future<bool> getOfflineDataStatus() async {
    return _sharedPreferences.getBool('hasOfflineData') ?? false;
  }
}
