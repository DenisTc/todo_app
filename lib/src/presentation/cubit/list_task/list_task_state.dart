part of 'list_task_cubit.dart';

@freezed
class ListTaskState with _$ListTaskState {
  const factory ListTaskState.initial() = _Initial;
  const factory ListTaskState.loading() = _Loading;
  const factory ListTaskState.loaded(
      {required List<TaskModel> listTask,
      required int countCompletedTask}) = _Loaded;
  const factory ListTaskState.error() = _Error;
}
