import 'package:todo_app/core/constants/todo.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

class Todo extends TodoEntity {
  Todo(
      {required super.id,
      required super.title,
      required super.description,
      required super.isDone,
      required super.createdAt,
      super.updatedAt});

  @override
  TodoEntity copy() {
    return Todo(
      id: id,
      title: title,
      description: description,
      isDone: isDone,
      createdAt: createdAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      TodoConstants.id: id,
      TodoConstants.title: title,
      TodoConstants.description: description,
      TodoConstants.isDone: isDone,
      TodoConstants.createdAt: createdAt.toIso8601String(),
      TodoConstants.updatedAt: updatedAt?.toIso8601String(),
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json[TodoConstants.id],
      title: json[TodoConstants.title],
      description: json[TodoConstants.description],
      isDone: json[TodoConstants.isDone],
      createdAt: DateTime.parse(json[TodoConstants.createdAt]),
      updatedAt: json[TodoConstants.updatedAt] != null
          ? DateTime.parse(json[TodoConstants.updatedAt])
          : null,
    );
  }
}
