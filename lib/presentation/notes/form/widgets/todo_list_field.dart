import 'package:another_flushbar/flushbar_helper.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/form/notes_form_bloc.dart';
import '../../../../domain/notes/value_objects.dart';
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
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            removeDuration: const Duration(),
            itemBuilder: (context, animation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, animation, inDrag) {
                  return ScaleTransition(
                    scale:
                        Tween<double>(begin: 1, end: 0.95).animate(animation),
                    child: TodoTile(
                      index: index,
                      elevation: inDrag ? 4 : 0,
                    ),
                  );
                },
              );
            },
            items: formTodos.value.asList(),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              final formTodos = Provider.of<FormTodos>(context, listen: false);
              formTodos.value = newItems.lock;
              final noteFormBloc = context.read<NotesFormBloc>();
              noteFormBloc.add(NotesFormEvent.todosChanged(formTodos.value));
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  final double elevation;

  const TodoTile({
    super.key,
    required this.index,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<FormTodos>(context, listen: false).value.get(
          index,
          orElse: (_) => TodoItemPrimitive.empty(),
        );

    final textEditingController = useTextEditingController(text: todo.name);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            foregroundColor: const Color(0xFFFE4A49),
            backgroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (_) {
              final formTodos = Provider.of<FormTodos>(context, listen: false);
              formTodos.value = formTodos.value.remove(todo);

              context
                  .read<NotesFormBloc>()
                  .add(NotesFormEvent.todosChanged(formTodos.value));
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
          elevation: elevation,
          borderRadius: BorderRadius.circular(8),
          animationDuration: const Duration(milliseconds: 50),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (bool? value) {
                  final formTodos =
                      Provider.of<FormTodos>(context, listen: false);
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
              title: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
                onChanged: (value) {
                  final formTodos =
                      Provider.of<FormTodos>(context, listen: false);
                  final notesFormBloc = context.read<NotesFormBloc>();
                  formTodos.value = formTodos.value
                      .map((todoList) => todoList == todo
                          ? todo.copyWith(name: value)
                          : todoList)
                      .toIList();

                  notesFormBloc.add(
                    NotesFormEvent.todosChanged(formTodos.value),
                  );
                },
                validator: (_) {
                  return context
                      .read<NotesFormBloc>()
                      .state
                      .note
                      .todos
                      .value
                      .fold(
                        (f) => null,
                        (todos) => todos[index].name.value.fold(
                              (f) => f.maybeMap(
                                empty: (_) => 'Cannot be empty',
                                exceedingLength: (_) => 'Too long',
                                multiline: (_) => 'Has to be in a single line',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      );
                },
              ),
              trailing: const Handle(child: Icon(Icons.list)),
            ),
          ),
        ),
      ),
    );
  }
}
