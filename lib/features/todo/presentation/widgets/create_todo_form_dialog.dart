import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/snackbar.dart';
import 'package:todo_app/features/todo/data/models/create_todo_model.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';

class CreateTodoDialog extends StatefulWidget {
  const CreateTodoDialog({super.key, required this.bloc});
  final TodoBloc bloc;

  static void show(BuildContext context, {required TodoBloc bloc}) {
    showDialog(
        context: context,
        builder: (context) => CreateTodoDialog(
              bloc: bloc,
            ));
  }

  @override
  State<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
  // input controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void deleteDialog() {
    Navigator.of(context).pop();
  }

  void _createTodo() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    if (title.isEmpty || description.isEmpty) return;

    final CreateTodoModel createTodoModel =
        CreateTodoModel(title: title, description: description);

    widget.bloc.add(TodoCreatingEvent(createTodoModel));

    deleteDialog();
    showSnackbar(context, 'Todo $title created');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title'),
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
            controller: _descriptionController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: deleteDialog,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _createTodo,
          child: const Text('Create'),
        ),
      ],
    );
  }
}
