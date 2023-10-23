import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';

class JobRemoteService {
  Client client = Client();

  Future<Response> fetchJob() async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.Job,
    );

    print("URL JOB: ${url.toString()}");

    return client.get(url);
  }
}
