import 'package:flutter/material.dart';

import '../../../../domain/notes/note.dart';

class ErrorNoteCard extends StatelessWidget {
  final Note note;

  const ErrorNoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text(
              'Invalid note, please contact support',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Details:',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              note.failureOption.fold(() => '', (f) => f.toString()),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
