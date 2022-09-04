import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/value_object.dart';
import '../../domain/notes/note.dart';
import '../../domain/notes/todo_item.dart';
import '../../domain/notes/value_objects.dart';

part 'dto_objects.freezed.dart';
part 'dto_objects.g.dart';

@freezed
class TodoItemDto with _$TodoItemDto {
  const TodoItemDto._();

  const factory TodoItemDto({
    required String id,
    required String name,
    required bool isDone,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      id: todoItem.id.getOrCrash,
      name: todoItem.name.getOrCrash,
      isDone: todoItem.isDone,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromString(id),
      name: TodoName(name),
      isDone: isDone,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}

@freezed
class NoteDto with _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    @JsonKey(ignore: true) String? id,
    required String body,
    required int color,
    required List<TodoItemDto> todos,
    @TimestampConverter() required String timeStamp,
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getOrCrash,
      body: note.body.getOrCrash,
      color: note.color.getOrCrash.value,
      todos: note.todos.getOrCrash
          .map((todoItem) => TodoItemDto.fromDomain(todoItem))
          .toList(),
      timeStamp: DateTime.now().toIso8601String(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromString(id!),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: ListOfTodo(
        IList(todos.map((todo) => todo.toDomain())),
      ),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot<Object?> doc) {
    return NoteDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

class TimestampConverter implements JsonConverter<String, Timestamp> {
  const TimestampConverter();

  @override
  String fromJson(Timestamp timestamp) {
    return timestamp.toDate().toIso8601String();
  }

  @override
  Timestamp toJson(String date) => Timestamp.fromDate(DateTime.parse(date));
}
