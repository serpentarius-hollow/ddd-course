import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/core/value_object.dart';
import '../../../../domain/notes/todo_item.dart';
import '../../../../domain/notes/value_objects.dart';

part 'todo_item_presentation_classes.freezed.dart';

class FormTodos extends ValueNotifier<IList<TodoItemPrimitive>> {
  FormTodos() : super(IList<TodoItemPrimitive>());
}

@freezed
class TodoItemPrimitive with _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool isDone,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() {
    return TodoItemPrimitive(
      id: UniqueId(),
      name: '',
      isDone: false,
    );
  }

  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
      id: todoItem.id,
      name: todoItem.name.getOrCrash,
      isDone: todoItem.isDone,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      isDone: isDone,
    );
  }
}
