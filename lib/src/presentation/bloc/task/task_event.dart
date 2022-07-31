part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.addTask(TaskModel task) = _AddTaskEvent;
  const factory TaskEvent.updateTask(TaskModel task) = _UpdateTaskEvent;
  const factory TaskEvent.deleteTask(String id) = _DeleteTaskEvent;
  const factory TaskEvent.completeTask(TaskModel task) = _CompleteTaskEvent;
}
