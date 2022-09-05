import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/actor/notes_actor_bloc.dart';
import '../../../../domain/notes/note.dart';
import '../../../../domain/notes/todo_item.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final noteActorBloc = context.read<NotesActorBloc>();

    return Card(
      color: note.color.getOrCrash,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to NoteFormPage
        },
        onLongPress: () {
          _showDeletionDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.body.getOrCrash),
              if (note.todos.length > 0) ...[
                Wrap(
                  spacing: 8,
                  children: note.todos.getOrCrash
                      .map(
                        (todo) => TodoDisplay(todo: todo),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(
    BuildContext context,
    NotesActorBloc bloc,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Note: '),
          content: Text(
            note.body.getOrCrash,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                bloc.add(NotesActorEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: todo.isDone ? Colors.blue : Colors.grey,
        ),
        Text(todo.name.getOrCrash)
      ],
    );
  }
}
