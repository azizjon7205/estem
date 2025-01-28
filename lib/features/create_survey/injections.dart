
import '/core/utils/injections.dart';
import 'data/local/pick_image_from_local.dart';
import 'data/local/pick_image_from_local_impl.dart';
import 'data/remote/categories_api.dart';
import 'data/remote/categories_api_impl.dart';
import 'data/remote/regions_api.dart';
import 'data/remote/regions_api_impl.dart';
import 'data/remote/survey_api.dart';
import 'data/remote/survey_api_impl.dart';
import 'data/remote/upload_image_api.dart';
import 'data/remote/upload_image_api_impl.dart';
import 'data/repositories/categories_repository_impl.dart';
import 'data/repositories/regions_repository_impl.dart';
import 'data/repositories/survey_repository_impl.dart';
import 'data/repositories/upload_image_repository_impl.dart';
import 'domain/repositories/categories_repository.dart';
import 'domain/repositories/regions_repository.dart';
import 'domain/repositories/survey_repository.dart';
import 'domain/repositories/upload_image_repository.dart';

void initCreateSurveyInjections() {

  // Remote data source
  sl.registerFactory<CategoriesApi>(() => CategoriesApiImpl(sl()));
  sl.registerFactory<RegionsApi>(() => RegionsApiImpl(sl()));
  sl.registerFactory<UploadImageApi>(() => UploadImageApiImpl(sl()));
  sl.registerFactory<PickImageFromLocal>(() => PickImageFromLocalImpl());
  sl.registerFactory<SurveyApi>(() => SurveyApiImpl(sl()));

  // Repositories
  sl.registerFactory<CategoriesRepository>(() => CategoriesRepositoryImpl(sl()));
  sl.registerFactory<RegionsRepository>(() => RegionsRepositoryImpl(sl()));
  sl.registerFactory<UploadImageRepository>(() => UploadImageRepositoryImpl(sl(), sl()));
  sl.registerFactory<SurveyRepository>(() => SurveyRepositoryImpl(sl()));

  // UserCases
}