import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../model/village/village_data.dart';

abstract class VillageRepository {
  Future<ResultEntity<List<VillageData>>> fetchVillage(String? subDistrictId);
}
