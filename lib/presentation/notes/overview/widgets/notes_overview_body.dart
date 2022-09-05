import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/watcher/notes_watcher_bloc.dart';
import 'critical_failure_body.dart';
import 'error_note_card.dart';
import 'note_card.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesWatcherBloc, NotesWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          failed: (state) {
            return CriticalFailureBody(
              failure: state.noteFailure,
            );
          },
          loaded: (state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final note = state.notes.elementAt(index);

                if (note.failureOption.isSome()) {
                  return ErrorNoteCard(note: note);
                } else {
                  return NoteCard(note: note);
                }
              },
              itemCount: state.notes.length,
            );
          },
        );
      },
    );
  }
}
