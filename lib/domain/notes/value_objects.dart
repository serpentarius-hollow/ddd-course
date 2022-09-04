import 'package:dartz/dartz.dart';
import 'package:ddd_course/domain/core/value_transformers.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    as i;
import 'package:flutter/material.dart';

import '../core/failures.dart';
import '../core/value_object.dart';
import '../core/value_validators.dart';

class NoteBody extends ValueObject<String> {
  static const maxLength = 100;

  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteBody(String input) {
    return NoteBody._(
      // Flatmap can chain the previous F and if previous F returned Left then Flatmap also return Left
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  static const maxLength = 30;

  @override
  final Either<ValueFailure<String>, String> value;

  factory TodoName(String input) {
    return TodoName._(
      // Flatmap can chain the previous F and if previous F returned Left then Flatmap also return Left
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) {
    return NoteColor._(right(makeColorOpaque(input)));
  }

  const NoteColor._(this.value);
}

class ListOfTodo<T> extends ValueObject<i.IList<T>> {
  static const maxLength = 3;

  @override
  final Either<ValueFailure<i.IList<T>>, i.IList<T>> value;

  factory ListOfTodo(i.IList<T> input) {
    return ListOfTodo._(
      validateMaxListLength(input, maxLength),
    );
  }

  const ListOfTodo._(this.value);

  int get length {
    return value.getOrElse(() => i.IList<T>(const [])).length;
  }

  bool get isFull {
    return length == maxLength;
  }
}
