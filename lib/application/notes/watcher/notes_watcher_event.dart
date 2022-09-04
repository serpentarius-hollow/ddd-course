part of 'notes_watcher_bloc.dart';

@freezed
class NotesWatcherEvent with _$NotesWatcherEvent {
  const factory NotesWatcherEvent.watchAllStarted() = WatchAllStarted;
  const factory NotesWatcherEvent.watchUncompletedStarted() =
      WatchUncompletedStarted;
  const factory NotesWatcherEvent.notesReceived(
      Either<NoteFailure, IList<Note>> failureOrNotes) = NotesReceived;
}
