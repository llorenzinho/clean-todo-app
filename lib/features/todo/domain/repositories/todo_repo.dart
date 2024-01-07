import 'package:todo_app/core/repository/repository.dart';
import 'package:todo_app/features/todo/domain/entities/create_todo_entity.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepo<T extends TodoEntity, E extends CreateTodoEntity>
    extends Repository<T, E> {}
