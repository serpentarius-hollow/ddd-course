import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/watcher/notes_watcher_bloc.dart';

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
            return Container(
              color: Colors.yellow,
              height: 100,
            );
          },
          loaded: (state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final note = state.notes.elementAt(index);

                if (note.failureOption.isSome()) {
                  return Container(
                    color: Colors.red,
                    height: 100,
                  );
                } else {
                  return Container(
                    color: Colors.green,
                    height: 100,
                  );
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
