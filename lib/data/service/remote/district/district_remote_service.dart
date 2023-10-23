import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';

class DistrictRemoteService {
  Client client = Client();

  Future<Response> fetchDistrict() async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + BaseConfig.fetchDistrict);

    print('URL : DISTRICT ${url}');
    return client.get(url);
  }
}
