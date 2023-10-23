import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class JobService {
  Client client = Client();

  Future<Response> fetchJob(AuthenticationHeadersRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.Job,
    );

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}
