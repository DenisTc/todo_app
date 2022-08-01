import 'package:todo_app/src/imports.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AppRepositoryImpl _appRepository;

  TaskBloc(this._appRepository) : super(const _Initial()) {
    on<_AddTaskEvent>(_addTask);
    on<_DeleteTaskEvent>(_deleteTask);
    on<_CompleteTaskEvent>(_completeTask);
    on<_UpdateTaskEvent>(_updateTask);
  }

  Future<void> _addTask(
    _AddTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
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

    _appRepository.addTask(newTask);
  }

  Future<void> _deleteTask(
    _DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    _appRepository.deleteTask(event.task);
  }

  Future<void> _updateTask(
    _UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
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

    _appRepository.updateTask(updatedTask);
  }

  Future<void> _completeTask(
    _CompleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
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

    _appRepository.updateTask(updatedTask);
  }
}
