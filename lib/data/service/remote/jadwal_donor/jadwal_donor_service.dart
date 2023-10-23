import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class JadwalDonorService {
  Client client = Client();

  Future<Response> fetchSchedule(
    AuthenticationHeadersRequest header,
    int unitId,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.SCHEDULE_LIST + "$unitId",
    );

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}
