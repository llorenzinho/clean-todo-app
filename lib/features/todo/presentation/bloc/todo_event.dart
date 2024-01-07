part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoadingEvent extends TodoEvent {}

class TodoLoadedEvent extends TodoEvent {
  const TodoLoadedEvent(this.todos);
  final List<TodoEntity> todos;
}

class TodoCreatedEvent extends TodoEvent {
  const TodoCreatedEvent(this.todo);
  final TodoEntity todo;
}

class TodoDeletingEvent extends TodoEvent {
  const TodoDeletingEvent(this.todo);
  final TodoEntity todo;
}

class TodoErrorEvent extends TodoEvent {
  const TodoErrorEvent(this.message);
  final String message;
}

class TodoUpdatedEvent extends TodoEvent {
  const TodoUpdatedEvent(this.todo);
  final TodoEntity todo;
}

class TodoCreatingEvent extends TodoEvent {
  const TodoCreatingEvent(this.todo);
  final CreateTodoEntity todo;
}

class DoneEvent extends TodoEvent {
  const DoneEvent(this.todo);
  final TodoEntity todo;
}
