import 'package:todo_app/src/imports.dart';

part 'all_tasks_response_entity.freezed.dart';
part 'all_tasks_response_entity.g.dart';

@freezed
class AllTasksResponseEntity with _$AllTasksResponseEntity {
  const AllTasksResponseEntity._();

  const factory AllTasksResponseEntity({
    required String status,
    List<TaskModel>? list,
    int? revision,
  }) = _AllTasksResponseEntity;

  factory AllTasksResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AllTasksResponseEntityFromJson(json);
}
