import '../../domain/entities/main_user.dart';
import '/core/network/api_service.dart';

import 'main_api.dart';

class MainApiImpl extends MainApi {
  final ApiService _network;

  MainApiImpl(this._network);

  @override
  Future<MainUser> getMainUser() {
    return _network.get<MainUser>(
      '/api/app/get_info',
      queryParameters: {"methodId": 7,},
      tFromJson: MainUser.fromJson,
    );
  }

}