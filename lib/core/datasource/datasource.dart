// A datasource for a given model should contain all the functions to interact with the database.

import 'package:todo_app/core/model/create_model.dart';
import 'package:todo_app/core/model/model.dart';

abstract class DataSource<T extends Model, E extends CreateModel> {
  Future<T> create(E model);
  Future<T?> update(T old, T newM);
  Future<T?> delete(String id);
  Future<T?> get(String id);

  Future<List<T>> list();
  Future<List<T>> filter(Map<String, dynamic> filter);
  Future<List<T>> deleteAll(List<String> ids);
  Future<List<T>> getAll(List<String> ids);
}
