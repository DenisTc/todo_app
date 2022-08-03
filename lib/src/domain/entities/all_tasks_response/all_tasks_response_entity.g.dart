// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllTasksResponseEntity _$$_AllTasksResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_AllTasksResponseEntity(
      status: json['status'] as String,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int?,
    );

Map<String, dynamic> _$$_AllTasksResponseEntityToJson(
        _$_AllTasksResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'list': instance.list,
      'revision': instance.revision,
    };
