import 'package:dartz/dartz.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    as i;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/failures.dart';
import '../core/value_object.dart';
import 'todo_item.dart';
import 'value_objects.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();

  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required ListOfTodo<TodoItem> todos,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: ListOfTodo(i.IList(const [])),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    final todosEntityFailureOrUnit = todos.getOrCrash
        // Filter those where failureOption is some
        .map((e) => e.failureOption)
        .where((o) => o.isSome())
        .toList()
        // If we can't get the 0th element, the list is empty. In such a case, it's valid.
        .get(0, orElse: (_) => none())
        // Fold the option
        .fold(
            () => right<ValueFailure<dynamic>, dynamic>(unit), (a) => left(a));

    return body.failureOrUnit
        // This is the ListOfTodo VALUE OBJECT
        .andThen(todos.failureOrUnit)
        // This is the TodoItem ENTITY
        .andThen(todosEntityFailureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
