import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/widgets/create_todo_form_dialog.dart';
import 'package:todo_app/features/todo/presentation/widgets/todo_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clean Todo App'),
        ),
        body: Center(child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoInitial || state is TodoLoading) {
              BlocProvider.of<TodoBloc>(context).add(TodoLoadingEvent());
              return const CircularProgressIndicator();
            } else if (state is TodoLoaded) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return TodoWidget(
                      completed: todo.isDone,
                      title: todo.title,
                      description: todo.description,
                      createdAt: todo.createdAt,
                      id: todo.id,
                    );
                  });
            } else if (state is TodoError) {
              return Text(state.message);
            } else if (state is TodoCreated) {
              BlocProvider.of<TodoBloc>(context).add(TodoLoadingEvent());
              return const Text('Todo created');
            } else if (state is TodoDeleted) {
              BlocProvider.of<TodoBloc>(context).add(TodoLoadingEvent());
              return const Text('Todo deleted');
            } else {
              return Text('Unknown state: ${state.runtimeType}');
            }
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => CreateTodoDialog.show(context,
              bloc: BlocProvider.of<TodoBloc>(context)),
          child: const Icon(Icons.add),
        ));
  }
}
