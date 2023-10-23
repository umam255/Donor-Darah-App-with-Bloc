import 'dart:io';
import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class UploadImageService {
  Client client = Client();
  Future<Response> postUploadImage(
    AuthenticationHeadersRequestUpload header,
    File image,
    String idRiwayat,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.UPLOAD_IMAGE + idRiwayat,
    );
    print("URL : ${url.toString()}");
    var multipartRequest = MultipartRequest('POST', url);

    var imageFile = await MultipartFile.fromPath(
      'file',
      image.path,
    );

    multipartRequest.files.add(imageFile);

    multipartRequest.headers.addAll(header.toHeader());

    var streamedResponse = await multipartRequest.send();
    var response = await Response.fromStream(streamedResponse);

    return response;
  }
}
