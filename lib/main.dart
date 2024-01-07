import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/pages/todo_page.dart';
import 'package:todo_app/injection_container.dart';

void main() async {
  await initializeDependecies();
  runApp(const BlocProvidedApp());
}

class BlocProvidedApp extends StatelessWidget {
  const BlocProvidedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TodoBloc>(
            create: (context) => sl<TodoBloc>(),
          ),
        ],
        child: const TodoPage(),
      ),
    );
  }
}
