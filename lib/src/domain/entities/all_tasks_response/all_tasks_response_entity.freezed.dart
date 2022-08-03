// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'all_tasks_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllTasksResponseEntity _$AllTasksResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _AllTasksResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$AllTasksResponseEntity {
  String get status => throw _privateConstructorUsedError;
  List<TaskModel>? get list => throw _privateConstructorUsedError;
  int? get revision => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllTasksResponseEntityCopyWith<AllTasksResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTasksResponseEntityCopyWith<$Res> {
  factory $AllTasksResponseEntityCopyWith(AllTasksResponseEntity value,
          $Res Function(AllTasksResponseEntity) then) =
      _$AllTasksResponseEntityCopyWithImpl<$Res>;
  $Res call({String status, List<TaskModel>? list, int? revision});
}

/// @nodoc
class _$AllTasksResponseEntityCopyWithImpl<$Res>
    implements $AllTasksResponseEntityCopyWith<$Res> {
  _$AllTasksResponseEntityCopyWithImpl(this._value, this._then);

  final AllTasksResponseEntity _value;
  // ignore: unused_field
  final $Res Function(AllTasksResponseEntity) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? list = freezed,
    Object? revision = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_AllTasksResponseEntityCopyWith<$Res>
    implements $AllTasksResponseEntityCopyWith<$Res> {
  factory _$$_AllTasksResponseEntityCopyWith(_$_AllTasksResponseEntity value,
          $Res Function(_$_AllTasksResponseEntity) then) =
      __$$_AllTasksResponseEntityCopyWithImpl<$Res>;
  @override
  $Res call({String status, List<TaskModel>? list, int? revision});
}

/// @nodoc
class __$$_AllTasksResponseEntityCopyWithImpl<$Res>
    extends _$AllTasksResponseEntityCopyWithImpl<$Res>
    implements _$$_AllTasksResponseEntityCopyWith<$Res> {
  __$$_AllTasksResponseEntityCopyWithImpl(_$_AllTasksResponseEntity _value,
      $Res Function(_$_AllTasksResponseEntity) _then)
      : super(_value, (v) => _then(v as _$_AllTasksResponseEntity));

  @override
  _$_AllTasksResponseEntity get _value =>
      super._value as _$_AllTasksResponseEntity;

  @override
  $Res call({
    Object? status = freezed,
    Object? list = freezed,
    Object? revision = freezed,
  }) {
    return _then(_$_AllTasksResponseEntity(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllTasksResponseEntity extends _AllTasksResponseEntity {
  const _$_AllTasksResponseEntity(
      {required this.status, final List<TaskModel>? list, this.revision})
      : _list = list,
        super._();

  factory _$_AllTasksResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AllTasksResponseEntityFromJson(json);

  @override
  final String status;
  final List<TaskModel>? _list;
  @override
  List<TaskModel>? get list {
    final value = _list;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? revision;

  @override
  String toString() {
    return 'AllTasksResponseEntity(status: $status, list: $list, revision: $revision)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllTasksResponseEntity &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality().equals(other.revision, revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(revision));

  @JsonKey(ignore: true)
  @override
  _$$_AllTasksResponseEntityCopyWith<_$_AllTasksResponseEntity> get copyWith =>
      __$$_AllTasksResponseEntityCopyWithImpl<_$_AllTasksResponseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllTasksResponseEntityToJson(
      this,
    );
  }
}

abstract class _AllTasksResponseEntity extends AllTasksResponseEntity {
  const factory _AllTasksResponseEntity(
      {required final String status,
      final List<TaskModel>? list,
      final int? revision}) = _$_AllTasksResponseEntity;
  const _AllTasksResponseEntity._() : super._();

  factory _AllTasksResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_AllTasksResponseEntity.fromJson;

  @override
  String get status;
  @override
  List<TaskModel>? get list;
  @override
  int? get revision;
  @override
  @JsonKey(ignore: true)
  _$$_AllTasksResponseEntityCopyWith<_$_AllTasksResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
