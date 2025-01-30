import '/core/utils/injections.dart';
import 'data/remote/filter_api.dart';
import 'data/remote/filter_api_impl.dart';
import 'data/repositories/filter_repository_impl.dart';
import 'domain/repositories/filter_repository.dart';


void initFilterInjections() {

  // Remote data source
  sl.registerFactory<FilterApi>(() => FilterApiImpl(sl()));

  // Repositories
  sl.registerFactory<FilterRepository>(() => FilterRepositoryImpl(sl()));

  // UserCases

}