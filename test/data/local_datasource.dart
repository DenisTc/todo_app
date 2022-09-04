import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/imports.dart';

void main() async {
  const baseLocation = './test/local_database_test_files/';

  WidgetsFlutterBinding.ensureInitialized();
  Hive.init(baseLocation);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  final boxTasks = Hive.box<TaskModel>('tasks');
  boxTasks.clear();

  SharedPreferences.setMockInitialValues({});
  final sharedPreferences = await SharedPreferences.getInstance();

  final db = LocalDataSourceImpl(
    boxTasks: boxTasks,
    sharedPreferences: sharedPreferences,
  );

  group('Test local datasource', () {
    test('add task', () async {
      // Arrange
      final task = TaskModel(
        id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b4',
        text: 'Text of task',
        importance: 'low',
        createdAt: DateTime(2021).millisecondsSinceEpoch,
        changedAt: DateTime(2022).millisecondsSinceEpoch,
        lastUpdatedBy: 'deviceId',
      );

      // Act
      db.addTask(task);
      final taskFomDB = await db.getAllTasks();

      // Assert
      expect(taskFomDB.length, 1);
      expect(taskFomDB.first.id, '810f71b7-b03f-4d7b-a5eb-1588fe29d9b4');
      expect(taskFomDB.first.text, 'Text of task');
      expect(taskFomDB.first.importance, 'low');
      expect(taskFomDB.first.createdAt, DateTime(2021).millisecondsSinceEpoch);
      expect(taskFomDB.first.changedAt, DateTime(2022).millisecondsSinceEpoch);
      expect(taskFomDB.first.lastUpdatedBy, 'deviceId');
    });
  });

  test('update task', () async {
    // Arrange
    final newTask = TaskModel(
      id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b4',
      text: 'New text of task',
      importance: 'hight',
      createdAt: DateTime(2021).millisecondsSinceEpoch,
      changedAt: DateTime(2022).millisecondsSinceEpoch,
      lastUpdatedBy: 'newDeviceId',
    );

    // Act
    db.updateTask(newTask);
    final taskFomDB = await db.getAllTasks();
    final updatedTask = taskFomDB.firstWhere((task) => task.id == newTask.id);

    // Assert
    expect(updatedTask.text, 'New text of task');
    expect(updatedTask.importance, 'hight');
    expect(updatedTask.createdAt, DateTime(2021).millisecondsSinceEpoch);
    expect(updatedTask.changedAt, DateTime(2022).millisecondsSinceEpoch);
    expect(updatedTask.lastUpdatedBy, 'newDeviceId');
  });

  test('delete task', () async {
    // Arrange
    final task = TaskModel(
      id: '810f71b7-b03f-4d7b-a5eb-1588fe29d9b4',
      text: 'Text of task',
      importance: 'low',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: 'deviceId',
    );

    // Act
    db.deleteTask(task);
    final taskFomDB = await db.getAllTasks();

    // Assert
    expect(taskFomDB.length, 0);
  });
}
