import '/core/network/api_service.dart';
import '/shared/models/region.dart';
import 'regions_api.dart';

class RegionsApiImpl extends RegionsApi {
  final ApiService _network;

  RegionsApiImpl(this._network);

  @override
  Future<List<Region>> getRegions() {
    return _network.get(
      'api/app/get_info',
      queryParameters: {"methodId": 10},
      tFromJson: (json) =>
          List<Region>.from(json['cities'].map((e) => Region.fromJson(e))),
    );
  }
}
