// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res> implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  final TaskEvent _value;
  // ignore: unused_field
  final $Res Function(TaskEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'TaskEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TaskEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_AddTaskEventCopyWith<$Res> {
  factory _$$_AddTaskEventCopyWith(
          _$_AddTaskEvent value, $Res Function(_$_AddTaskEvent) then) =
      __$$_AddTaskEventCopyWithImpl<$Res>;
  $Res call({TaskModel task});
}

/// @nodoc
class __$$_AddTaskEventCopyWithImpl<$Res> extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_AddTaskEventCopyWith<$Res> {
  __$$_AddTaskEventCopyWithImpl(
      _$_AddTaskEvent _value, $Res Function(_$_AddTaskEvent) _then)
      : super(_value, (v) => _then(v as _$_AddTaskEvent));

  @override
  _$_AddTaskEvent get _value => super._value as _$_AddTaskEvent;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$_AddTaskEvent(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$_AddTaskEvent implements _AddTaskEvent {
  const _$_AddTaskEvent(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'TaskEvent.addTask(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTaskEvent &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$_AddTaskEventCopyWith<_$_AddTaskEvent> get copyWith =>
      __$$_AddTaskEventCopyWithImpl<_$_AddTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) {
    return addTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) {
    return addTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) {
    return addTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class _AddTaskEvent implements TaskEvent {
  const factory _AddTaskEvent(final TaskModel task) = _$_AddTaskEvent;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$_AddTaskEventCopyWith<_$_AddTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateTaskEventCopyWith<$Res> {
  factory _$$_UpdateTaskEventCopyWith(
          _$_UpdateTaskEvent value, $Res Function(_$_UpdateTaskEvent) then) =
      __$$_UpdateTaskEventCopyWithImpl<$Res>;
  $Res call({TaskModel task});
}

/// @nodoc
class __$$_UpdateTaskEventCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_UpdateTaskEventCopyWith<$Res> {
  __$$_UpdateTaskEventCopyWithImpl(
      _$_UpdateTaskEvent _value, $Res Function(_$_UpdateTaskEvent) _then)
      : super(_value, (v) => _then(v as _$_UpdateTaskEvent));

  @override
  _$_UpdateTaskEvent get _value => super._value as _$_UpdateTaskEvent;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$_UpdateTaskEvent(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$_UpdateTaskEvent implements _UpdateTaskEvent {
  const _$_UpdateTaskEvent(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'TaskEvent.updateTask(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTaskEvent &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateTaskEventCopyWith<_$_UpdateTaskEvent> get copyWith =>
      __$$_UpdateTaskEventCopyWithImpl<_$_UpdateTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) {
    return updateTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) {
    return updateTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) {
    return updateTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) {
    return updateTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateTaskEvent implements TaskEvent {
  const factory _UpdateTaskEvent(final TaskModel task) = _$_UpdateTaskEvent;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$_UpdateTaskEventCopyWith<_$_UpdateTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteTaskEventCopyWith<$Res> {
  factory _$$_DeleteTaskEventCopyWith(
          _$_DeleteTaskEvent value, $Res Function(_$_DeleteTaskEvent) then) =
      __$$_DeleteTaskEventCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteTaskEventCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_DeleteTaskEventCopyWith<$Res> {
  __$$_DeleteTaskEventCopyWithImpl(
      _$_DeleteTaskEvent _value, $Res Function(_$_DeleteTaskEvent) _then)
      : super(_value, (v) => _then(v as _$_DeleteTaskEvent));

  @override
  _$_DeleteTaskEvent get _value => super._value as _$_DeleteTaskEvent;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DeleteTaskEvent(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteTaskEvent implements _DeleteTaskEvent {
  const _$_DeleteTaskEvent(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TaskEvent.deleteTask(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTaskEvent &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteTaskEventCopyWith<_$_DeleteTaskEvent> get copyWith =>
      __$$_DeleteTaskEventCopyWithImpl<_$_DeleteTaskEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) {
    return deleteTask(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) {
    return deleteTask?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class _DeleteTaskEvent implements TaskEvent {
  const factory _DeleteTaskEvent(final String id) = _$_DeleteTaskEvent;

  String get id;
  @JsonKey(ignore: true)
  _$$_DeleteTaskEventCopyWith<_$_DeleteTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CompleteTaskEventCopyWith<$Res> {
  factory _$$_CompleteTaskEventCopyWith(_$_CompleteTaskEvent value,
          $Res Function(_$_CompleteTaskEvent) then) =
      __$$_CompleteTaskEventCopyWithImpl<$Res>;
  $Res call({TaskModel task});
}

/// @nodoc
class __$$_CompleteTaskEventCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res>
    implements _$$_CompleteTaskEventCopyWith<$Res> {
  __$$_CompleteTaskEventCopyWithImpl(
      _$_CompleteTaskEvent _value, $Res Function(_$_CompleteTaskEvent) _then)
      : super(_value, (v) => _then(v as _$_CompleteTaskEvent));

  @override
  _$_CompleteTaskEvent get _value => super._value as _$_CompleteTaskEvent;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$_CompleteTaskEvent(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$_CompleteTaskEvent implements _CompleteTaskEvent {
  const _$_CompleteTaskEvent(this.task);

  @override
  final TaskModel task;

  @override
  String toString() {
    return 'TaskEvent.completeTask(task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompleteTaskEvent &&
            const DeepCollectionEquality().equals(other.task, task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(task));

  @JsonKey(ignore: true)
  @override
  _$$_CompleteTaskEventCopyWith<_$_CompleteTaskEvent> get copyWith =>
      __$$_CompleteTaskEventCopyWithImpl<_$_CompleteTaskEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TaskModel task) addTask,
    required TResult Function(TaskModel task) updateTask,
    required TResult Function(String id) deleteTask,
    required TResult Function(TaskModel task) completeTask,
  }) {
    return completeTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
  }) {
    return completeTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TaskModel task)? addTask,
    TResult Function(TaskModel task)? updateTask,
    TResult Function(String id)? deleteTask,
    TResult Function(TaskModel task)? completeTask,
    required TResult orElse(),
  }) {
    if (completeTask != null) {
      return completeTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTaskEvent value) addTask,
    required TResult Function(_UpdateTaskEvent value) updateTask,
    required TResult Function(_DeleteTaskEvent value) deleteTask,
    required TResult Function(_CompleteTaskEvent value) completeTask,
  }) {
    return completeTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
  }) {
    return completeTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTaskEvent value)? addTask,
    TResult Function(_UpdateTaskEvent value)? updateTask,
    TResult Function(_DeleteTaskEvent value)? deleteTask,
    TResult Function(_CompleteTaskEvent value)? completeTask,
    required TResult orElse(),
  }) {
    if (completeTask != null) {
      return completeTask(this);
    }
    return orElse();
  }
}

abstract class _CompleteTaskEvent implements TaskEvent {
  const factory _CompleteTaskEvent(final TaskModel task) = _$_CompleteTaskEvent;

  TaskModel get task;
  @JsonKey(ignore: true)
  _$$_CompleteTaskEventCopyWith<_$_CompleteTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res> implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  final TaskState _value;
  // ignore: unused_field
  final $Res Function(TaskState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$TaskStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TaskState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TaskState {
  const factory _Initial() = _$_Initial;
}
