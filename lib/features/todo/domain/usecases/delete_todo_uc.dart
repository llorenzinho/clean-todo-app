import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class DeleteTodoUc extends UseCase<TodoEntity?, String> {
  final TodoRepo _todoRepository;

  DeleteTodoUc(this._todoRepository);

  @override
  Future<TodoEntity?> call(String id) async {
    return await _todoRepository.delete(id);
  }
}
