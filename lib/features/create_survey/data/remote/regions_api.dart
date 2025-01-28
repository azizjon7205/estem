import '/shared/models/region.dart';

abstract class RegionsApi {
  Future<List<Region>> getRegions();
}