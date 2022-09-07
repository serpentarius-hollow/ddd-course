import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/form/notes_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesFormBloc, NotesFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        final formTodosProvider =
            Provider.of<FormTodos>(context, listen: false);
        formTodosProvider.value = state.note.todos.value.fold(
          (f) => IList(const []),
          (todos) => todos
              .map(
                (todo) => TodoItemPrimitive.fromDomain(todo),
              )
              .toIList(),
        );
      },
      buildWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add Todo'),
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.add),
          ),
          onTap: () {
            final notesFormBloc = context.read<NotesFormBloc>();
            final formTodosProvider =
                Provider.of<FormTodos>(context, listen: false);

            formTodosProvider.value = formTodosProvider.value.add(
              TodoItemPrimitive.empty(),
            );

            notesFormBloc.add(
              NotesFormEvent.todosChanged(
                formTodosProvider.value,
              ),
            );
          },
        );
      },
    );
  }
}
