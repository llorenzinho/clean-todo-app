import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget(
      {super.key,
      required this.completed,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.id});
  final bool completed;
  final String title;
  final String description;
  final DateTime createdAt;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Checkbox(
        value: completed,
        onChanged: (value) {
          final TodoEntity todoEntity = Todo(
              id: id,
              title: title,
              description: description,
              isDone: value!,
              createdAt: createdAt);
          BlocProvider.of<TodoBloc>(context).add(TodoUpdatedEvent(todoEntity));
        },
      ),
    ));
  }
}

class TodoUpdatingEvent {}
