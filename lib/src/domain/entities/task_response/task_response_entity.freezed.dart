// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskResponseEntity _$TaskResponseEntityFromJson(Map<String, dynamic> json) {
  return _TaskResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$TaskResponseEntity {
  String get status => throw _privateConstructorUsedError;
  TaskModel? get element => throw _privateConstructorUsedError;
  int? get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskResponseEntityCopyWith<TaskResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskResponseEntityCopyWith<$Res> {
  factory $TaskResponseEntityCopyWith(
          TaskResponseEntity value, $Res Function(TaskResponseEntity) then) =
      _$TaskResponseEntityCopyWithImpl<$Res>;
  $Res call({String status, TaskModel? element, int? revision});
}

/// @nodoc
class _$TaskResponseEntityCopyWithImpl<$Res>
    implements $TaskResponseEntityCopyWith<$Res> {
  _$TaskResponseEntityCopyWithImpl(this._value, this._then);

  final TaskResponseEntity _value;
  // ignore: unused_field
  final $Res Function(TaskResponseEntity) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? element = freezed,
    Object? revision = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskResponseEntityCopyWith<$Res>
    implements $TaskResponseEntityCopyWith<$Res> {
  factory _$$_TaskResponseEntityCopyWith(_$_TaskResponseEntity value,
          $Res Function(_$_TaskResponseEntity) then) =
      __$$_TaskResponseEntityCopyWithImpl<$Res>;
  @override
  $Res call({String status, TaskModel? element, int? revision});
}

/// @nodoc
class __$$_TaskResponseEntityCopyWithImpl<$Res>
    extends _$TaskResponseEntityCopyWithImpl<$Res>
    implements _$$_TaskResponseEntityCopyWith<$Res> {
  __$$_TaskResponseEntityCopyWithImpl(
      _$_TaskResponseEntity _value, $Res Function(_$_TaskResponseEntity) _then)
      : super(_value, (v) => _then(v as _$_TaskResponseEntity));

  @override
  _$_TaskResponseEntity get _value => super._value as _$_TaskResponseEntity;

  @override
  $Res call({
    Object? status = freezed,
    Object? element = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$_TaskResponseEntity(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskResponseEntity extends _TaskResponseEntity {
  const _$_TaskResponseEntity(
      {required this.status, this.element, this.revision})
      : super._();

  factory _$_TaskResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TaskResponseEntityFromJson(json);

  @override
  final String status;
  @override
  final TaskModel? element;
  @override
  final int? revision;

  @override
  String toString() {
    return 'TaskResponseEntity(status: $status, element: $element, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskResponseEntity &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.element, element) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(element),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$_TaskResponseEntityCopyWith<_$_TaskResponseEntity> get copyWith =>
      __$$_TaskResponseEntityCopyWithImpl<_$_TaskResponseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskResponseEntityToJson(
      this,
    );
  }
}

abstract class _TaskResponseEntity extends TaskResponseEntity {
  const factory _TaskResponseEntity(
      {required final String status,
      final TaskModel? element,
      final int? revision}) = _$_TaskResponseEntity;
  const _TaskResponseEntity._() : super._();

  factory _TaskResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_TaskResponseEntity.fromJson;

  @override
  String get status;
  @override
  TaskModel? get element;
  @override
  int? get revision;
  @override
  @JsonKey(ignore: true)
  _$$_TaskResponseEntityCopyWith<_$_TaskResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
