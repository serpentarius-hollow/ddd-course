import 'package:flutter/material.dart';

import '../../../../domain/notes/note_failure.dart';

class CriticalFailureBody extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureBody({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Unexpected Error'),
          Text(
            failure.maybeMap(
              insufficientPermission: (value) => 'Insufficient Permission',
              orElse: () => 'Critical Failure',
            ),
          )
        ],
      ),
    );
  }
}
