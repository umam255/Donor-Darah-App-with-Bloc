import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';

class VillageRemoteService {
  Client client = Client();
  Future<Response> fetchVillage(String? subDistrictId) async {
    var queryParam = {'subDistrictId': subDistrictId};
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchVillage,
      queryParam,
    );
    print('URL VILLAGE : ${url}');
    return client.get(url);
  }
}
