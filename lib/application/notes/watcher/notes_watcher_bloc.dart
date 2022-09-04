import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide IList;
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';

part 'notes_watcher_bloc.freezed.dart';
part 'notes_watcher_event.dart';
part 'notes_watcher_state.dart';

@injectable
class NotesWatcherBloc extends Bloc<NotesWatcherEvent, NotesWatcherState> {
  final INoteRepository _noteRepository;

  StreamSubscription<Either<NoteFailure, IList<Note>>>? _noteStreamSubscription;

  NotesWatcherBloc(this._noteRepository)
      : super(const NotesWatcherState.initial()) {
    on<WatchAllStarted>(
      (event, emit) {
        emit(const NotesWatcherState.loading());
        _noteStreamSubscription?.cancel();
        _noteStreamSubscription =
            _noteRepository.watchAll().listen((failureOrNotes) {
          add(NotesWatcherEvent.notesReceived(failureOrNotes));
        });
      },
    );

    on<WatchUncompletedStarted>(
      (event, emit) {
        emit(const NotesWatcherState.loading());
        _noteStreamSubscription?.cancel();
        _noteStreamSubscription =
            _noteRepository.watchUncompleted().listen((failureOrNotes) {
          add(NotesWatcherEvent.notesReceived(failureOrNotes));
        });
      },
    );

    on<NotesReceived>(
      (event, emit) {
        emit(event.failureOrNotes.fold(
          (f) => NotesWatcherState.failed(f),
          (notes) => NotesWatcherState.loaded(notes),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _noteStreamSubscription?.cancel();
    return super.close();
  }
}
