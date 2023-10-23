import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_data.dart';

abstract class AgendaDetailRepository {
  Future<ResultEntity<AgendaDetailData>> fetchDetailAgenda(
    AuthenticationHeadersRequest header,
    String idAgenda,
  );
}
