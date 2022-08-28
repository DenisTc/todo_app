class TaskCubitModel {
  final String? id;
  final String text;
  final String importance;
  final int? deadline;
  final bool? done;
  final String? color;
  final int? createdAt;

  TaskCubitModel({
    this.id,
    required this.text,
    required this.importance,
    this.deadline,
    this.done,
    this.color,
    this.createdAt,
  });
}
