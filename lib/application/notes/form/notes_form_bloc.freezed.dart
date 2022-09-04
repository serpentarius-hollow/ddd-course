// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesFormEventCopyWith<$Res> {
  factory $NotesFormEventCopyWith(
          NotesFormEvent value, $Res Function(NotesFormEvent) then) =
      _$NotesFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotesFormEventCopyWithImpl<$Res>
    implements $NotesFormEventCopyWith<$Res> {
  _$NotesFormEventCopyWithImpl(this._value, this._then);

  final NotesFormEvent _value;
  // ignore: unused_field
  final $Res Function(NotesFormEvent) _then;
}

/// @nodoc
abstract class _$$InitializedCopyWith<$Res> {
  factory _$$InitializedCopyWith(
          _$Initialized value, $Res Function(_$Initialized) then) =
      __$$InitializedCopyWithImpl<$Res>;
  $Res call({Note? note});

  $NoteCopyWith<$Res>? get note;
}

/// @nodoc
class __$$InitializedCopyWithImpl<$Res>
    extends _$NotesFormEventCopyWithImpl<$Res>
    implements _$$InitializedCopyWith<$Res> {
  __$$InitializedCopyWithImpl(
      _$Initialized _value, $Res Function(_$Initialized) _then)
      : super(_value, (v) => _then(v as _$Initialized));

  @override
  _$Initialized get _value => super._value as _$Initialized;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(_$Initialized(
      note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
    ));
  }

  @override
  $NoteCopyWith<$Res>? get note {
    if (_value.note == null) {
      return null;
    }

    return $NoteCopyWith<$Res>(_value.note!, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$Initialized implements Initialized {
  const _$Initialized(this.note);

  @override
  final Note? note;

  @override
  String toString() {
    return 'NotesFormEvent.initialized(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialized &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      __$$InitializedCopyWithImpl<_$Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return initialized(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return initialized?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized implements NotesFormEvent {
  const factory Initialized(final Note? note) = _$Initialized;

  Note? get note;
  @JsonKey(ignore: true)
  _$$InitializedCopyWith<_$Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BodyChangedCopyWith<$Res> {
  factory _$$BodyChangedCopyWith(
          _$BodyChanged value, $Res Function(_$BodyChanged) then) =
      __$$BodyChangedCopyWithImpl<$Res>;
  $Res call({String bodyStr});
}

/// @nodoc
class __$$BodyChangedCopyWithImpl<$Res>
    extends _$NotesFormEventCopyWithImpl<$Res>
    implements _$$BodyChangedCopyWith<$Res> {
  __$$BodyChangedCopyWithImpl(
      _$BodyChanged _value, $Res Function(_$BodyChanged) _then)
      : super(_value, (v) => _then(v as _$BodyChanged));

  @override
  _$BodyChanged get _value => super._value as _$BodyChanged;

  @override
  $Res call({
    Object? bodyStr = freezed,
  }) {
    return _then(_$BodyChanged(
      bodyStr == freezed
          ? _value.bodyStr
          : bodyStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BodyChanged implements BodyChanged {
  const _$BodyChanged(this.bodyStr);

  @override
  final String bodyStr;

  @override
  String toString() {
    return 'NotesFormEvent.bodyChanged(bodyStr: $bodyStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyChanged &&
            const DeepCollectionEquality().equals(other.bodyStr, bodyStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bodyStr));

  @JsonKey(ignore: true)
  @override
  _$$BodyChangedCopyWith<_$BodyChanged> get copyWith =>
      __$$BodyChangedCopyWithImpl<_$BodyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return bodyChanged(bodyStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return bodyChanged?.call(bodyStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (bodyChanged != null) {
      return bodyChanged(bodyStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) {
    return bodyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) {
    return bodyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (bodyChanged != null) {
      return bodyChanged(this);
    }
    return orElse();
  }
}

abstract class BodyChanged implements NotesFormEvent {
  const factory BodyChanged(final String bodyStr) = _$BodyChanged;

  String get bodyStr;
  @JsonKey(ignore: true)
  _$$BodyChangedCopyWith<_$BodyChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorChangedCopyWith<$Res> {
  factory _$$ColorChangedCopyWith(
          _$ColorChanged value, $Res Function(_$ColorChanged) then) =
      __$$ColorChangedCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class __$$ColorChangedCopyWithImpl<$Res>
    extends _$NotesFormEventCopyWithImpl<$Res>
    implements _$$ColorChangedCopyWith<$Res> {
  __$$ColorChangedCopyWithImpl(
      _$ColorChanged _value, $Res Function(_$ColorChanged) _then)
      : super(_value, (v) => _then(v as _$ColorChanged));

  @override
  _$ColorChanged get _value => super._value as _$ColorChanged;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_$ColorChanged(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColorChanged implements ColorChanged {
  const _$ColorChanged(this.color);

  @override
  final Color color;

  @override
  String toString() {
    return 'NotesFormEvent.colorChanged(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorChanged &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$ColorChangedCopyWith<_$ColorChanged> get copyWith =>
      __$$ColorChangedCopyWithImpl<_$ColorChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return colorChanged(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return colorChanged?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) {
    return colorChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) {
    return colorChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (colorChanged != null) {
      return colorChanged(this);
    }
    return orElse();
  }
}

abstract class ColorChanged implements NotesFormEvent {
  const factory ColorChanged(final Color color) = _$ColorChanged;

  Color get color;
  @JsonKey(ignore: true)
  _$$ColorChangedCopyWith<_$ColorChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodosChangedCopyWith<$Res> {
  factory _$$TodosChangedCopyWith(
          _$TodosChanged value, $Res Function(_$TodosChanged) then) =
      __$$TodosChangedCopyWithImpl<$Res>;
  $Res call({IList<TodoItemPrimitive> todos});
}

/// @nodoc
class __$$TodosChangedCopyWithImpl<$Res>
    extends _$NotesFormEventCopyWithImpl<$Res>
    implements _$$TodosChangedCopyWith<$Res> {
  __$$TodosChangedCopyWithImpl(
      _$TodosChanged _value, $Res Function(_$TodosChanged) _then)
      : super(_value, (v) => _then(v as _$TodosChanged));

  @override
  _$TodosChanged get _value => super._value as _$TodosChanged;

  @override
  $Res call({
    Object? todos = freezed,
  }) {
    return _then(_$TodosChanged(
      todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as IList<TodoItemPrimitive>,
    ));
  }
}

/// @nodoc

class _$TodosChanged implements TodosChanged {
  const _$TodosChanged(this.todos);

  @override
  final IList<TodoItemPrimitive> todos;

  @override
  String toString() {
    return 'NotesFormEvent.todosChanged(todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosChanged &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$$TodosChangedCopyWith<_$TodosChanged> get copyWith =>
      __$$TodosChangedCopyWithImpl<_$TodosChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return todosChanged(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return todosChanged?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (todosChanged != null) {
      return todosChanged(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) {
    return todosChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) {
    return todosChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (todosChanged != null) {
      return todosChanged(this);
    }
    return orElse();
  }
}

abstract class TodosChanged implements NotesFormEvent {
  const factory TodosChanged(final IList<TodoItemPrimitive> todos) =
      _$TodosChanged;

  IList<TodoItemPrimitive> get todos;
  @JsonKey(ignore: true)
  _$$TodosChangedCopyWith<_$TodosChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedCopyWith<$Res> {
  factory _$$SavedCopyWith(_$Saved value, $Res Function(_$Saved) then) =
      __$$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedCopyWithImpl<$Res> extends _$NotesFormEventCopyWithImpl<$Res>
    implements _$$SavedCopyWith<$Res> {
  __$$SavedCopyWithImpl(_$Saved _value, $Res Function(_$Saved) _then)
      : super(_value, (v) => _then(v as _$Saved));

  @override
  _$Saved get _value => super._value as _$Saved;
}

/// @nodoc

class _$Saved implements Saved {
  const _$Saved();

  @override
  String toString() {
    return 'NotesFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Note? note) initialized,
    required TResult Function(String bodyStr) bodyChanged,
    required TResult Function(Color color) colorChanged,
    required TResult Function(IList<TodoItemPrimitive> todos) todosChanged,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Note? note)? initialized,
    TResult Function(String bodyStr)? bodyChanged,
    TResult Function(Color color)? colorChanged,
    TResult Function(IList<TodoItemPrimitive> todos)? todosChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(BodyChanged value) bodyChanged,
    required TResult Function(ColorChanged value) colorChanged,
    required TResult Function(TodosChanged value) todosChanged,
    required TResult Function(Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(BodyChanged value)? bodyChanged,
    TResult Function(ColorChanged value)? colorChanged,
    TResult Function(TodosChanged value)? todosChanged,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements NotesFormEvent {
  const factory Saved() = _$Saved;
}

/// @nodoc
mixin _$NotesFormState {
  Note get note => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesFormStateCopyWith<NotesFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesFormStateCopyWith<$Res> {
  factory $NotesFormStateCopyWith(
          NotesFormState value, $Res Function(NotesFormState) then) =
      _$NotesFormStateCopyWithImpl<$Res>;
  $Res call(
      {Note note,
      bool isEditing,
      bool isLoading,
      bool showErrorMessages,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccess});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$NotesFormStateCopyWithImpl<$Res>
    implements $NotesFormStateCopyWith<$Res> {
  _$NotesFormStateCopyWithImpl(this._value, this._then);

  final NotesFormState _value;
  // ignore: unused_field
  final $Res Function(NotesFormState) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? isEditing = freezed,
    Object? isLoading = freezed,
    Object? showErrorMessages = freezed,
    Object? saveFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccess: saveFailureOrSuccess == freezed
          ? _value.saveFailureOrSuccess
          : saveFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }

  @override
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $NotesFormStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {Note note,
      bool isEditing,
      bool isLoading,
      bool showErrorMessages,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccess});

  @override
  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$NotesFormStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? note = freezed,
    Object? isEditing = freezed,
    Object? isLoading = freezed,
    Object? showErrorMessages = freezed,
    Object? saveFailureOrSuccess = freezed,
  }) {
    return _then(_$_Initial(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccess: saveFailureOrSuccess == freezed
          ? _value.saveFailureOrSuccess
          : saveFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.note,
      required this.isEditing,
      required this.isLoading,
      required this.showErrorMessages,
      required this.saveFailureOrSuccess});

  @override
  final Note note;
  @override
  final bool isEditing;
  @override
  final bool isLoading;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<NoteFailure, Unit>> saveFailureOrSuccess;

  @override
  String toString() {
    return 'NotesFormState(note: $note, isEditing: $isEditing, isLoading: $isLoading, showErrorMessages: $showErrorMessages, saveFailureOrSuccess: $saveFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.saveFailureOrSuccess, saveFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(saveFailureOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements NotesFormState {
  const factory _Initial(
      {required final Note note,
      required final bool isEditing,
      required final bool isLoading,
      required final bool showErrorMessages,
      required final Option<Either<NoteFailure, Unit>>
          saveFailureOrSuccess}) = _$_Initial;

  @override
  Note get note;
  @override
  bool get isEditing;
  @override
  bool get isLoading;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
