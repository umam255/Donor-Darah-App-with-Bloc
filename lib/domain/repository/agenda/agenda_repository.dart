import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/agenda/agenda_data.dart';

abstract class AgendaRepository {
  Future<ResultEntity<List<AgendaData>>> fetchAgenda(
    AuthenticationHeadersRequest header,
  );
}
