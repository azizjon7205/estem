
import '/shared/models/region.dart';
import '../../domain/repositories/regions_repository.dart';
import '../remote/regions_api.dart';

class RegionsRepositoryImpl extends RegionsRepository {
  final RegionsApi _api;

  RegionsRepositoryImpl(this._api);

  @override
  Future<List<Region>> getRegions() {
    return _api.getRegions();
  }

}