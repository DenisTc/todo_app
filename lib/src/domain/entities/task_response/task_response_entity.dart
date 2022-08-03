import 'package:todo_app/src/imports.dart';

part 'task_response_entity.freezed.dart';
part 'task_response_entity.g.dart';

@freezed
class TaskResponseEntity with _$TaskResponseEntity {
  const TaskResponseEntity._();

  const factory TaskResponseEntity({
    required String status,
    TaskModel? element,
    int? revision,
  }) = _TaskResponseEntity;

  factory TaskResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseEntityFromJson(json);
}
