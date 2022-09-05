import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../application/notes/watcher/notes_watcher_bloc.dart';

class NotesSwitch extends HookWidget {
  const NotesSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkResponse(
        onTap: () {
          toggleState.value = !toggleState.value;
          final notesWatcherBloc = context.read<NotesWatcherBloc>();

          notesWatcherBloc.add(toggleState.value
              ? const NotesWatcherEvent.watchUncompletedStarted()
              : const NotesWatcherEvent.watchAllStarted());
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: toggleState.value
              ? const Icon(
                  Icons.check_box_outline_blank,
                  key: Key('blank'),
                )
              : const Icon(
                  Icons.indeterminate_check_box,
                  key: Key('indeterminate'),
                ),
        ),
      ),
    );
  }
}
