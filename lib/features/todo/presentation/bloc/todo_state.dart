part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  const TodoLoaded({required this.todos});
  final List<TodoEntity> todos;
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoError extends TodoState {
  const TodoError({required this.message});
  final String message;
}

class TodoCreated extends TodoState {
  const TodoCreated({required this.todo});
  final TodoEntity todo;
}

class TodoDeleted extends TodoState {
  const TodoDeleted({required this.todo});
  final TodoEntity todo;
}

class TodoUpdated extends TodoState {
  const TodoUpdated({required this.todo});
  final TodoEntity todo;
}
