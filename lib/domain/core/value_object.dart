import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool get isValid => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((f) => left(f), (_) => right(unit));
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T get getOrCrash => value.fold(
        (f) => throw UnexpectedValueError(f),
        id,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value($value)';
  }
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(const Uuid().v4()));
  }

  factory UniqueId.fromString(String input) {
    return UniqueId._(right(input));
  }

  const UniqueId._(this.value);
}
