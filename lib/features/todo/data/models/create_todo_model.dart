import 'package:todo_app/features/todo/domain/entities/create_todo_entity.dart';

class CreateTodoModel extends CreateTodoEntity {
  CreateTodoModel({
    required String title,
    required String description,
  }) : super(
          title: title,
          description: description,
        );
}
