import '../../core/utils/injections.dart';
import 'data/local/pick_file_from_local.dart';
import 'data/local/pick_file_from_local_impl.dart';
import 'data/remote/survey_pass_api.dart';
import 'data/remote/survey_pass_api_impl.dart';
import 'data/remote/upload_file_api.dart';
import 'data/remote/upload_file_api_impl.dart';
import 'data/repositories/survey_pass_repository_impl.dart';
import 'data/repositories/upload_file_repository_impl.dart';
import 'domain/repositories/survey_pass_repository.dart';
import 'domain/repositories/upload_file_repository.dart';

void initSurveyInjections() {
  // Remote data source
  sl.registerFactory<UploadFileApi>(() => UploadFileApiImpl(sl()));
  sl.registerFactory<PickFileFromLocal>(() => PickFileFromLocalImpl());
  sl.registerFactory<SurveyPassApi>(
          () => SurveyPassApiImpl(sl()));

  // Repositories
  sl.registerFactory<UploadFileRepository>(
      () => UploadFileRepositoryImpl(sl(), sl()));
  sl.registerFactory<SurveyPassRepository>(
          () => SurveyPassRepositoryImpl(sl()));
}
