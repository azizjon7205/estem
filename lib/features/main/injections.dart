import '../../core/utils/injections.dart';
import 'data/remote/main_api.dart';
import 'data/remote/main_api_impl.dart';
import 'data/repositories/main_repository_impl.dart';
import 'domain/repositories/main_repository.dart';

void initMainInjections() {

  // Remote data source
  sl.registerFactory<MainApi>(() => MainApiImpl(sl()));

  // Repositories
  sl.registerFactory<MainRepository>(() => MainRepositoryImpl(sl()));

  // UserCases

}