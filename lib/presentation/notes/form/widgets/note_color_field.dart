import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/form/notes_form_bloc.dart';
import '../../../../domain/notes/value_objects.dart';

class NoteColorField extends StatelessWidget {
  const NoteColorField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesFormBloc, NotesFormState>(
      buildWhen: (previous, current) =>
          previous.note.color != current.note.color,
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () {
                  final notesFormBloc = context.read<NotesFormBloc>();
                  notesFormBloc.add(
                    NotesFormEvent.colorChanged(itemColor),
                  );
                },
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  shape: CircleBorder(
                    side: state.note.color.value.fold(
                      (_) => BorderSide.none,
                      (color) => color == itemColor
                          ? const BorderSide(width: 1.5)
                          : BorderSide.none,
                    ),
                  ),
                  child: const SizedBox(
                    width: 56,
                    height: 56,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemCount: NoteColor.predefinedColors.length,
          ),
        );
      },
    );
  }
}
