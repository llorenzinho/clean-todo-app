import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class GetTodoUC extends UseCase<TodoEntity?, String> {
  final TodoRepo repository;

  GetTodoUC(this.repository);

  @override
  Future<TodoEntity?> call(String id) async {
    return await repository.get(id);
  }
}
