part of 'notes_form_bloc.dart';

@freezed
class NotesFormEvent with _$NotesFormEvent {
  const factory NotesFormEvent.initialized(Note? note) = Initialized;
  const factory NotesFormEvent.bodyChanged(String bodyStr) = BodyChanged;
  const factory NotesFormEvent.colorChanged(Color color) = ColorChanged;
  const factory NotesFormEvent.todosChanged(IList<TodoItemPrimitive> todos) =
      TodosChanged;
  const factory NotesFormEvent.saved() = Saved;
}
