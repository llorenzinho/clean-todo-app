import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/entities/create_todo_entity.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/usecases/create_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/get_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/list_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/update_todo_uc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  // UseCases
  final CreateTodoUC createTodoUC;
  final DeleteTodoUc deleteTodoUc;
  final GetTodoUC getTodoUC;
  final UpdateTodoUC updateTodoUC;
  final ListTodoUC listTodoUC;

  TodoBloc(this.createTodoUC, this.deleteTodoUc, this.getTodoUC,
      this.updateTodoUC, this.listTodoUC)
      : super(TodoInitial()) {
    on<TodoLoadingEvent>(_loadTodos);
    on<TodoCreatingEvent>(_createTodo);
    on<TodoDeletingEvent>(_deleteTodo);
    on<TodoUpdatedEvent>(_updateTodo);
    on<DoneEvent>(_done);
  }

  void _updateTodo(TodoUpdatedEvent event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());
    final result = await updateTodoUC((event.todo.id, event.todo));
    if (result == null) {
      emit(const TodoError(message: 'Error updating todo'));
      return;
    }
    emit(const TodoLoading());
  }

  void _done(DoneEvent event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());
  }

  void _deleteTodo(TodoDeletingEvent event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());
    final result = await deleteTodoUc(event.todo.id);
    if (result == null) {
      emit(const TodoError(message: 'Error deleting todo'));
      return;
    }
    emit(TodoDeleted(todo: result));
  }

  void _loadTodos(TodoLoadingEvent event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());
    final result = await listTodoUC(null);
    emit(TodoLoaded(todos: result));
  }

  void _createTodo(TodoCreatingEvent event, Emitter<TodoState> emit) async {
    emit(const TodoLoading());
    final result = await createTodoUC(event.todo);
    emit(TodoCreated(todo: result));
  }
}
