import 'package:get_it/get_it.dart';
import 'package:todo_app/features/todo/data/datasources/dummy_datasource.dart';
import 'package:todo_app/features/todo/data/repositories/todo_repo_impl.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';
import 'package:todo_app/features/todo/domain/usecases/create_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/get_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/list_todo_uc.dart';
import 'package:todo_app/features/todo/domain/usecases/update_todo_uc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // Register singletons for all data sources
  sl.registerSingleton<DummyTodoDS>(DummyTodoDS());
  sl.registerSingleton<TodoRepo>(TodoRepoImpl(sl()));

  // Register singletons for all use cases
  sl.registerSingleton<GetTodoUC>(GetTodoUC(sl()));
  sl.registerSingleton<ListTodoUC>(ListTodoUC(sl()));
  sl.registerSingleton<CreateTodoUC>(CreateTodoUC(sl()));
  sl.registerSingleton<DeleteTodoUc>(DeleteTodoUc(sl()));
  sl.registerSingleton<UpdateTodoUC>(UpdateTodoUC(sl()));

  // Register factories for all blocs
  sl.registerFactory<TodoBloc>(() => TodoBloc(sl(), sl(), sl(), sl(), sl()));
}
