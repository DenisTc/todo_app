import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(fieldRename: FieldRename.snake)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String importance;

  @HiveField(3)
  final int? deadline;

  @HiveField(4)
  final bool done;

  @HiveField(5)
  final String? color;

  @HiveField(6)
  final int createdAt;

  @HiveField(7)
  final int changedAt;

  @HiveField(8)
  final String lastUpdatedBy;

  TaskModel({
    required this.id,
    required this.text,
    required this.importance,
    this.deadline,
    this.done = false,
    this.color,
    required this.createdAt,
    required this.changedAt,
    required this.lastUpdatedBy,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
