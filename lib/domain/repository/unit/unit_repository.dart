import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/agenda/unit_data.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';

abstract class UnitRepository {
  Future<ResultEntity<List<UnitData>>> fetchUnit(RegisterRequest request);
}
