import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class UpdateTodoUC extends UseCase<TodoEntity?, (String, TodoEntity)> {
  final TodoRepo repository;

  UpdateTodoUC(this.repository);

  @override
  Future<TodoEntity?> call((String, TodoEntity) params) async {
    return await repository.update(params.$1, params.$2);
  }
}
