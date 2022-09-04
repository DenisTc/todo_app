import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:todo_app/src/data/datasource/local/models/task_model.dart';
import 'package:todo_app/src/data/repositories/app_repository_impl.dart';

part 'list_task_state.dart';
part 'list_task_cubit.freezed.dart';

class ListTaskCubit extends Cubit<ListTaskState> {
  final AppRepositoryImpl _appRepository;

  ListTaskCubit(this._appRepository) : super(const ListTaskState.initial());

  Future<void> loadListTask() async {
    emit(const _Loading());

    final listTask = await _appRepository.getAllTasks();
    final countCompletedTask = listTask.where((task) => task.done).length;

    emit(
      _Loaded(
        listTask: listTask,
        countCompletedTask: countCompletedTask,
      ),
    );
  }

  Future<void> deleteTask(TaskModel task) async {
    _appRepository.deleteTask(task);
  }

  Future<void> completeTask(TaskModel task) async {
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

    loadListTask();
  }
}
