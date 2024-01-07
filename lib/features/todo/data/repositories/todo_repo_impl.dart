import 'package:todo_app/features/todo/data/datasources/dummy_datasource.dart';
import 'package:todo_app/features/todo/data/models/create_todo_model.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class TodoRepoImpl extends TodoRepo<Todo, CreateTodoModel> {
  @override
  // ignore: overridden_fields
  final DummyTodoDS dataSource;

  TodoRepoImpl(
    this.dataSource,
  );

  @override
  Future<Todo> create(CreateTodoModel model) {
    return Future.value(dataSource.create(model));
  }

  @override
  Future<Todo?> delete(String id) {
    return Future.value(dataSource.delete(id));
  }

  @override
  Future<List<Todo>> deleteAll(List<String> ids) {
    return Future.value(dataSource.deleteAll(ids));
  }

  @override
  Future<List<Todo>> filter(Map<String, dynamic> filter) {
    return dataSource.filter(filter);
  }

  @override
  Future<Todo?> get(String id) {
    return dataSource.get(id);
  }

  @override
  Future<List<Todo>> getAll(List<String> ids) {
    return dataSource.getAll(ids);
  }

  @override
  Future<List<Todo>> list() {
    return dataSource.list();
  }

  @override
  Future<Todo?> update(String id, Todo newM) async {
    final Todo? old = await dataSource.get(id);
    if (old == null) {
      return null;
    }
    return dataSource.update(old, newM);
  }
}
