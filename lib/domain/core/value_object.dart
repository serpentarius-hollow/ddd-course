import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool get isValid => value.isRight();

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
