import 'package:dartz/dartz.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    as i;

import 'note.dart';
import 'note_failure.dart';

abstract class INoteRepository {
  // Watch all notes
  Stream<Either<NoteFailure, i.IList<Note>>> watchAll();
  // Watch uncompleted notes
  Stream<Either<NoteFailure, i.IList<Note>>> watchUncompleted();
  // Create
  Future<Either<NoteFailure, Unit>> create(Note note);
  // Update
  Future<Either<NoteFailure, Unit>> update(Note note);
  // Delete
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
