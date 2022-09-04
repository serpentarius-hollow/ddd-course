part of 'notes_watcher_bloc.dart';

@freezed
class NotesWatcherState with _$NotesWatcherState {
  const factory NotesWatcherState.initial() = _Initial;
  const factory NotesWatcherState.loading() = _Loading;
  const factory NotesWatcherState.loaded(IList<Note> notes) = _Loaded;
  const factory NotesWatcherState.failed(NoteFailure noteFailure) = _Failed;
}
