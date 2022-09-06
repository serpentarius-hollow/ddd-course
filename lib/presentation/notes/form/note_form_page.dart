import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/notes/form/notes_form_bloc.dart';
import '../../../domain/notes/note.dart';
import '../../../injection.dart';
import '../../loading/loading_screen.dart';
import '../../routes/router.gr.dart';

class NoteFormPage extends StatelessWidget {
  final Note? editedNote;

  const NoteFormPage({super.key, this.editedNote});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NotesFormBloc>()..add(NotesFormEvent.initialized(editedNote)),
      child: BlocListener<NotesFormBloc, NotesFormState>(
        listenWhen: (previous, current) =>
            previous.saveFailureOrSuccess != current.saveFailureOrSuccess,
        listener: (context, state) {
          if (state.isLoading) {
            LoadingScreen.instance().show(
              context: context,
              text: 'Loading...',
            );
          } else {
            LoadingScreen.instance().hide();
          }

          state.saveFailureOrSuccess.fold(
            () {},
            (either) {
              either.fold(
                (f) {
                  FlushbarHelper.createError(
                    message: f.map(
                      unexpected: (_) => 'Unexpected Error',
                      insufficientPermission: (_) => 'Insufficient Permission',
                      unableToUpdate: (_) => 'Unable to Update',
                    ),
                  ).show(context);
                },
                (_) {
                  context.router.popUntil((route) =>
                      route.settings.name == NotesOverviewRoute.name);
                },
              );
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<NotesFormBloc, NotesFormState>(
              buildWhen: (previous, current) =>
                  previous.isEditing != current.isEditing,
              builder: (context, state) {
                return Text(
                  state.isEditing ? 'Edit a Note' : 'Create a Note',
                );
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context
                      .read<NotesFormBloc>()
                      .add(const NotesFormEvent.saved());
                },
                icon: const Icon(Icons.check),
              )
            ],
          ),
        ),
      ),
    );
  }
}
