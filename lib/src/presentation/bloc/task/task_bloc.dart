import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const _Initial()) {
    on<_AddTaskEvent>(_addTask);
    on<_DeleteTaskEvent>(_deleteTask);
    on<_CompleteTaskEvent>(_completeTaskEvent);
    on<_UpdateTaskEvent>(_updateTask);
  }

  Future<void> _addTask(
    _AddTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final box = Hive.box<TaskModel>('tasks');
    const uuid = Uuid();
    final deviceId = await PlatformDeviceId.getDeviceId;

    final newTask = TaskModel(
      id: uuid.v4(),
      text: event.task.text,
      importance: event.task.importance,
      deadline: event.task.deadline,
      done: false,
      // color: '',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: deviceId!,
    );

    box.add(newTask);
  }

  Future<void> _deleteTask(
    _DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final box = Hive.box<TaskModel>('tasks');
    final task = box.values.firstWhere((task) => task.id == event.id);

    await task.delete();
  }

  Future<void> _updateTask(
    _UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final box = Hive.box<TaskModel>('tasks');
    final deviceId = await PlatformDeviceId.getDeviceId;

    final updatedTask = TaskModel(
      id: event.task.id,
      text: event.task.text,
      importance: event.task.importance,
      deadline: event.task.deadline,
      done: event.task.done,
      color: event.task.color,
      createdAt: event.task.changedAt,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: deviceId!,
    );

    final key = box.values.firstWhere((task) => task.id == updatedTask.id).key;

    box.put(key, updatedTask);
  }

  Future<void> _completeTaskEvent(
    _CompleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final box = Hive.box<TaskModel>('tasks');
    final deviceId = await PlatformDeviceId.getDeviceId;

    final updatedTask = TaskModel(
      id: event.task.id,
      text: event.task.text,
      importance: event.task.importance,
      deadline: event.task.deadline,
      done: !event.task.done,
      color: event.task.color,
      createdAt: event.task.createdAt,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: deviceId!,
    );

    final key = box.values.firstWhere((task) => task.id == updatedTask.id).key;

    box.put(key, updatedTask);
  }
}
