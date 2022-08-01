import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/data/datasource/local/local_datasource.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/storage/hive_db.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final Box<TaskModel> _box;
  HiveDB hiveDB = HiveDB();

  LocalDataSourceImpl(this._box);

  @override
  Future<void> addTask(TaskModel task) async {
    _box.add(task);
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    final taskToDelete =
        _box.values.firstWhere((boxTask) => boxTask.id == task.id);

    await taskToDelete.delete();
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final key = _box.values.firstWhere((boxTask) => boxTask.id == task.id).key;

    _box.put(key, task);
  }
}
