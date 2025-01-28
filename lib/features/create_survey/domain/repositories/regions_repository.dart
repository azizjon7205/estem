import '/shared/models/region.dart';

abstract class RegionsRepository {
  Future<List<Region>> getRegions();
}