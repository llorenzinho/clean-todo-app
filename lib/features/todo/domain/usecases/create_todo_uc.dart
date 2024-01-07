import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/todo/domain/entities/create_todo_entity.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class CreateTodoUC extends UseCase<TodoEntity, CreateTodoEntity> {
  final TodoRepo repository;

  CreateTodoUC(this.repository);

  @override
  Future<TodoEntity> call(CreateTodoEntity entity) async {
    return await repository.create(entity);
  }
}
