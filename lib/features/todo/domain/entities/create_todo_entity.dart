import 'package:todo_app/core/model/create_model.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

abstract class CreateTodoEntity with CreateModel<TodoEntity> {
  final String title;
  final String description;

  CreateTodoEntity({
    required this.title,
    required this.description,
  });
}
