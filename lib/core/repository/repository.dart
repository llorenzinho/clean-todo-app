// A repository is a class that contains all the logic to interact with the database
//  Using a given datasource, it can create, update, delete, get, list, filter, deleteAll, and getAll entries in the database.

import 'package:todo_app/core/datasource/datasource.dart';
import 'package:todo_app/core/model/create_model.dart';
import 'package:todo_app/core/model/model.dart';

abstract class Repository<T extends Model, E extends CreateModel> {
  late DataSource<T, E> dataSource;

  Future<T> create(E model);
  Future<T?> update(String id, T newM);
  Future<T?> delete(String id);
  Future<T?> get(String id);

  Future<List<T>> list();
  Future<List<T>> filter(Map<String, dynamic> filter);
  Future<List<T>> deleteAll(List<String> ids);
  Future<List<T>> getAll(List<String> ids);
}
