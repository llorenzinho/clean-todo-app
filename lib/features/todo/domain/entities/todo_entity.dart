import 'package:todo_app/core/model/model.dart';
import 'package:todo_app/features/todo/domain/entities/create_todo_entity.dart';

abstract class TodoEntity extends CreateTodoEntity with Model {
  final String id;
  final bool isDone;
  final DateTime createdAt;
  final DateTime? updatedAt;

  TodoEntity({
    required this.id,
    required super.title,
    required super.description,
    required this.isDone,
    required this.createdAt,
    this.updatedAt,
  });
}
