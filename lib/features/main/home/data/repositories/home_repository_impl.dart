
import '../../domain/entities/home_catalog.dart';
import '../../domain/entities/home_surveys.dart';
import '../../domain/entities/home_user.dart';
import '../../domain/repositories/home_repository.dart';
import '../remote/home_api.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApi _api;

  HomeRepositoryImpl(this._api);

  @override
  Future<List<HomeCatalog>> getHomeCatalogs() {
    return _api.getHomeCatalogs();
  }

  @override
  Future<HomeSurveys> getHomeSurveys() {
    return _api.getHomeSurveys();
  }

  @override
  Future<HomeUser> getHomeUser() {
    return _api.getHomeUser();
  }



}