import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../application/notes/form/notes_form_bloc.dart';
import '../../../../domain/notes/value_objects.dart';

class NoteBodyField extends HookWidget {
  const NoteBodyField({super.key});

  @override
  Widget build(BuildContext context) {
    final notesFormBloc = context.read<NotesFormBloc>();
    final textEditingController = useTextEditingController();

    return BlocListener<NotesFormBloc, NotesFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          maxLength: NoteBody.maxLength,
          minLines: 3,
          maxLines: null,
          decoration: const InputDecoration(
            labelText: 'Note',
            counterText: '',
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          onChanged: (value) =>
              notesFormBloc.add(NotesFormEvent.bodyChanged(value)),
          validator: (_) => notesFormBloc.state.note.body.value.fold(
            (f) => f.maybeMap(
              empty: (_) => 'Cannot be empty',
              exceedingLength: (f) => 'Exceeding length. Max: ${f.max}',
              orElse: () => null,
            ),
            (_) => null,
          ),
        ),
      ),
    );
  }
}
