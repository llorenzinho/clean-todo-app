import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class ListTodoUC extends UseCase<List<TodoEntity>, void> {
  final TodoRepo repository;

  ListTodoUC(this.repository);

  @override
  Future<List<TodoEntity>> call(void parameters) async {
    return await repository.list();
  }
}
