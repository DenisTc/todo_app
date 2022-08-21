import 'package:flutter/material.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';

class AppStateManager extends ChangeNotifier {
  TaskModel? selectedTask;
  String? textNewTask;

  TaskModel? get getSelectedTask => selectedTask;
  String? get getTextNewTask => textNewTask;

  void goToTask(task) {
    selectedTask = task;
    notifyListeners();
  }

  void addNewTask(text) {
    textNewTask = text;
    notifyListeners();
  }

  void resetState() {
    selectedTask = null;
    textNewTask = null;
  }
}
