import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';
import '../../../../base/base_config/base_config.dart';

class RescheduleDonorService {
  Client client = Client();
  Future<Response> postReschedule(
    String idAgenda,
    int idSchedule,
    AuthenticationHeadersRequest header,
  ) async {
    var body = {"id": idSchedule};
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.RESCHEDULE_DONOR + idAgenda,
    );
    print("URL : ${url.toString()}");
    return client.post(url, body: body);
  }
}
