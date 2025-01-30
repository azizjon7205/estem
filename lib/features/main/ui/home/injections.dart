
import '/core/utils/injections.dart';
import 'data/remote/home_api.dart';
import 'data/remote/home_api_impl.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';

void initHomeInjections() {

  // Remote data source
  sl.registerFactory<HomeApi>(() => HomeApiImpl(sl()));

  // Repositories
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(sl()));

  // UserCases

}