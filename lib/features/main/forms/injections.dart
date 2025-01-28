
import '/core/utils/injections.dart';
import 'data/remote/forms_api.dart';
import 'data/remote/forms_api_impl.dart';
import 'data/repositories/forms_repository_impl.dart';
import 'domain/repositories/forms_repository.dart';

void initFormsInjections() {

  // Remote data source
  sl.registerFactory<FormsApi>(() => FormsApiImpl(sl()));

  // Repositories
  sl.registerFactory<FormsRepository>(() => FormsRepositoryImpl(sl()));

  // UserCases

}