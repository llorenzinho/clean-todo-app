import 'dart:math';

import 'package:todo_app/core/datasource/datasource.dart';
import 'package:todo_app/features/todo/data/models/create_todo_model.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';

class DummyTodoDS extends DataSource<Todo, CreateTodoModel> {
  final Map<String, Todo> db = {};

  @override
  Future<Todo> create(CreateTodoModel model) {
    String id = Random().nextInt(1000000).toString();
    while (db.containsKey(id)) {
      id = Random().nextInt(1000000).toString();
    }
    final Todo todo = Todo(
      id: id,
      title: model.title,
      description: model.description,
      isDone: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    db[id] = todo;
    return Future.value(todo);
  }

  @override
  Future<Todo?> delete(String id) {
    return Future.value(db.remove(id));
  }

  @override
  Future<List<Todo>> deleteAll(List<String> ids) {
    final List<Todo> removed = [];
    for (String id in ids) {
      final Todo? todo = db.remove(id);
      if (todo != null) {
        removed.add(todo);
      }
    }
    return Future.value(removed);
  }

  @override
  Future<List<Todo>> filter(Map<String, dynamic> filter) {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Todo?> get(String id) {
    return Future.value(db.containsKey(id) ? db[id] : null);
  }

  @override
  Future<List<Todo>> getAll(List<String> ids) {
    final List<Todo> ret = [];
    for (String id in ids) {
      if (db.containsKey(id)) {
        ret.add(db[id]!);
      }
    }
    return Future.value(ret);
  }

  @override
  Future<List<Todo>> list() {
    return Future.value(db.values.toList());
  }

  @override
  Future<Todo> update(Todo old, Todo newM) {
    final Todo todo = Todo(
      id: old.id,
      title: newM.title,
      description: newM.description,
      isDone: newM.isDone,
      createdAt: old.createdAt,
      updatedAt: DateTime.now(),
    );
    db[newM.id] = todo;
    return Future.value(todo);
  }
}
