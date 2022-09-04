import 'package:todo_app/src/imports.dart';
import 'package:todo_app/src/presentation/cubit/task/model/task_cubit_model.dart';

part 'task_state.dart';
part 'task_cubit.freezed.dart';

class TaskCubit extends Cubit<TaskState> {
  final AppRepositoryImpl _appRepository;

  TaskCubit(this._appRepository) : super(const TaskState.initial());

  Future<void> addTask(TaskCubitModel task) async {
    emit(const _InProcess());
    final taskId = const Uuid().v4();
    final deviceId = await PlatformDeviceId.getDeviceId;
    const done = false;
    final dateTimeNow = DateTime.now().millisecondsSinceEpoch;

    final newTask = TaskModel(
      id: taskId,
      text: task.text,
      importance: task.importance,
      deadline: task.deadline,
      done: done,
      createdAt: dateTimeNow,
      changedAt: dateTimeNow,
      lastUpdatedBy: deviceId!,
    );

    _appRepository.addTask(newTask);

    emit(const _Success());
  }

  Future<void> deleteTask(TaskModel task) async {
    emit(const _InProcess());

    _appRepository.deleteTask(task);

    emit(const _Success());
  }

  Future<void> updateTask(TaskCubitModel task) async {
    emit(const _InProcess());

    final taskId = task.id ?? const Uuid().v4();
    final deviceId = await PlatformDeviceId.getDeviceId;
    final done = task.done ?? false;
    final createdAt = task.createdAt ?? DateTime.now().millisecondsSinceEpoch;
    final changedAt = DateTime.now().millisecondsSinceEpoch;

    final updatedTask = TaskModel(
      id: taskId,
      text: task.text,
      importance: task.importance,
      deadline: task.deadline,
      done: done,
      color: task.color,
      createdAt: createdAt,
      changedAt: changedAt,
      lastUpdatedBy: deviceId!,
    );

    _appRepository.updateTask(updatedTask);
    emit(const _Success());
  }

  Future<void> completeTask(TaskModel task) async {
    emit(const _InProcess());
    final deviceId = await PlatformDeviceId.getDeviceId;

    final updatedTask = TaskModel(
      id: task.id,
      text: task.text,
      importance: task.importance,
      deadline: task.deadline,
      done: !task.done,
      color: task.color,
      createdAt: task.createdAt,
      changedAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdatedBy: deviceId!,
    );

    _appRepository.updateTask(updatedTask);
    emit(const _Success());
  }
}
