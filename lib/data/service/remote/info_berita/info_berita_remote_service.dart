// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:http/http.dart';

class InfoBeritaRemoteService {
  Client client = Client();
  final apiKey = "7836484668b2444790b62b14a877ef91";

  Future<Response> infoBerita(
      String page, String limit, String categoryId) async {
    Map<String, dynamic> queries = {};
    queries['apiKey'] = apiKey;
    queries['page'] = page;
    queries['limit'] = limit;
    queries['categoryId'] = categoryId;

    final url = Uri.https("newsapi.org", "/v1/article", queries);

    print("URL : ${url.toString()}");
    return client.get(url);
  }
}
