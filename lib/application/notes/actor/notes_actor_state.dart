part of 'notes_actor_bloc.dart';

@freezed
class NotesActorState with _$NotesActorState {
  const factory NotesActorState.initial() = _Initial;
  const factory NotesActorState.loading() = _Loading;
  const factory NotesActorState.deleteFailed(NoteFailure noteFailure) =
      _DeleteFailed;
  const factory NotesActorState.deleteSuccess() = _DeleteSuccess;
}
