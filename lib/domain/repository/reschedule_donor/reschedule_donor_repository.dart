import 'package:donor_darah/domain/base/authentication_headers_request.dart';

import '../../../base/result_entity/result_entity.dart';

abstract class RescheduleDonorRepository {
  Future<ResultEntity> postReschedule(
    String idAgenda,
    int idSchedule,
    AuthenticationHeadersRequest header,
  );
}
