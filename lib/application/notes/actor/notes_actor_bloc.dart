import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';

part 'notes_actor_bloc.freezed.dart';
part 'notes_actor_event.dart';
part 'notes_actor_state.dart';

@injectable
class NotesActorBloc extends Bloc<NotesActorEvent, NotesActorState> {
  final INoteRepository _noteRepository;

  NotesActorBloc(this._noteRepository)
      : super(const NotesActorState.initial()) {
    on<Deleted>(
      (event, emit) async {
        emit(const NotesActorState.loading());
        final result = await _noteRepository.delete(event.note);
        result.fold(
          (f) => emit(NotesActorState.deleteFailed(f)),
          (_) => emit(const NotesActorState.deleteSuccess()),
        );
      },
    );
  }
}
