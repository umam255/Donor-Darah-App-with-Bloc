import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../model/district/district.dart';

abstract class DistrictRepository {
  Future<ResultEntity<List<DistrictData>>> fetchDistrict();
}
