part of 'notes_form_bloc.dart';

@freezed
class NotesFormState with _$NotesFormState {
  const factory NotesFormState({
    required Note note,
    required bool isEditing,
    required bool isLoading,
    required bool showErrorMessages,
    required Option<Either<NoteFailure, Unit>> saveFailureOrSuccess,
  }) = _Initial;

  factory NotesFormState.initial() => NotesFormState(
        note: Note.empty(),
        isEditing: false,
        isLoading: false,
        showErrorMessages: false,
        saveFailureOrSuccess: none(),
      );
}
