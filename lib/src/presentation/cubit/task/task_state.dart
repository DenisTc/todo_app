part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;
  const factory TaskState.inProcess() = _InProcess;
  const factory TaskState.success() = _Success;
  const factory TaskState.error() = _Error;
}
