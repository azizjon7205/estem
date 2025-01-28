import 'package:estem/features/main/home/domain/entities/home_user.dart';

import '../../domain/entities/home_catalog.dart';
import '/core/network/api_service.dart';
import '../../domain/entities/home_surveys.dart';
import 'home_api.dart';

class HomeApiImpl extends HomeApi {
  final ApiService _network;

  HomeApiImpl(this._network);

  @override
  Future<HomeSurveys> getHomeSurveys() async {
    return await _network.post<HomeSurveys>(
      '/api/app/function/run',
      data: {"method_id": 4, "limit": 4},
      tFromJson: HomeSurveys.fromJson,
    );
  }

  @override
  Future<List<HomeCatalog>> getHomeCatalogs() async {
    return await _network.get<List<HomeCatalog>>(
      '/api/app/get_info',
      queryParameters: {"methodId": 3,},
      tFromJson: (json) => List<HomeCatalog>.from(
        json.map((e) => HomeCatalog.fromJson(e)),
      ),
    );
  }

  @override
  Future<HomeUser> getHomeUser() async{
    return await _network.get<HomeUser>(
      '/api/app/get_info',
      queryParameters: {"methodId": 7,},
      tFromJson: HomeUser.fromJson,
    );
  }
}
