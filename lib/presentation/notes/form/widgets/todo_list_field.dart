import 'package:another_flushbar/flushbar_helper.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/form/notes_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';

class TodoListField extends StatelessWidget {
  const TodoListField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesFormBloc, NotesFormState>(
      listenWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer list? Activate premium.',
            button: TextButton(
              onPressed: () {},
              child: const Text('Buy Now'),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TodoTile(
                index: index,
              );
            },
            itemCount: formTodos.value.length,
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<FormTodos>(context).value.get(
          index,
          orElse: (_) => TodoItemPrimitive.empty(),
        );
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          final formTodos = Provider.of<FormTodos>(context, listen: false);
          final notesFormBloc = context.read<NotesFormBloc>();
          formTodos.value = formTodos.value
              .map(
                (todoList) => todoList == todo
                    ? todo.copyWith(isDone: value ?? false)
                    : todoList,
              )
              .toIList();

          notesFormBloc.add(
            NotesFormEvent.todosChanged(formTodos.value),
          );
        },
      ),
    );
  }
}
