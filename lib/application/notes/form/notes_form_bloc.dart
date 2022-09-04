import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide IList;
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../domain/notes/value_objects.dart';
import '../../../presentation/notes/form/misc/todo_item_presentation_classes.dart';

part 'notes_form_bloc.freezed.dart';
part 'notes_form_event.dart';
part 'notes_form_state.dart';

@injectable
class NotesFormBloc extends Bloc<NotesFormEvent, NotesFormState> {
  final INoteRepository _noteRepository;

  NotesFormBloc(this._noteRepository) : super(NotesFormState.initial()) {
    on<Initialized>(
      (event, emit) {
        if (event.note != null) {
          emit(
            state.copyWith(
              note: event.note!,
              isEditing: true,
            ),
          );
        }
      },
    );

    on<BodyChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            note: state.note.copyWith(body: NoteBody(event.bodyStr)),
            saveFailureOrSuccess: none(),
          ),
        );
      },
    );

    on<ColorChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            note: state.note.copyWith(color: NoteColor(event.color)),
            saveFailureOrSuccess: none(),
          ),
        );
      },
    );

    on<TodosChanged>(
      (event, emit) {
        // ListOfTodo
        emit(
          state.copyWith(
            note: state.note.copyWith(
              todos: ListOfTodo(
                // TodoItem
                event.todos.map((todo) => todo.toDomain()).toIList(),
              ),
            ),
            saveFailureOrSuccess: none(),
          ),
        );
      },
    );

    on<Saved>(
      (event, emit) async {
        Either<NoteFailure, Unit>? failureOrSuccess;

        emit(
          state.copyWith(
            isLoading: true,
            saveFailureOrSuccess: none(),
          ),
        );

        if (state.note.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.update(state.note)
              : await _noteRepository.create(state.note);
        }

        emit(
          state.copyWith(
            isLoading: false,
            showErrorMessages: true,
            saveFailureOrSuccess: optionOf(failureOrSuccess),
          ),
        );
      },
    );
  }
}
