import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';

class HiveDB {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>('tasks');
  }
}
