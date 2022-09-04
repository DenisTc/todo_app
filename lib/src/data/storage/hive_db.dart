import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/storage/box_names.dart';

class HiveDB {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(BoxNames.tasks);
  }

  Box<TaskModel> getBoxTasks() => Hive.box<TaskModel>(BoxNames.tasks);
}
