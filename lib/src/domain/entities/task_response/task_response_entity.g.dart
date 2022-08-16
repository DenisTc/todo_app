// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskResponseEntity _$$_TaskResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_TaskResponseEntity(
      status: json['status'] as String,
      element: json['element'] == null
          ? null
          : TaskModel.fromJson(json['element'] as Map<String, dynamic>),
      revision: json['revision'] as int?,
    );

Map<String, dynamic> _$$_TaskResponseEntityToJson(
        _$_TaskResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'element': instance.element,
      'revision': instance.revision,
    };
