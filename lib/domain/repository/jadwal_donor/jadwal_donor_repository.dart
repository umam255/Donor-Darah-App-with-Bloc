import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';

abstract class JadwalDonorRepository {
  Future<ResultEntity<List<ScheduleData>>> fetchSchedule(
    AuthenticationHeadersRequest header,
    int unitId,
  );
}
