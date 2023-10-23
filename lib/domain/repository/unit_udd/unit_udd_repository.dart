import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/data/unit_udd/unit_udd_data.dart';

abstract class UnitUddRepository {
  Future<ResultEntity<List<UnitUddData>>> fetchUnitUdd();
}
