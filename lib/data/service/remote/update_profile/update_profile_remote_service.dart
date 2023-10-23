import 'dart:collection';
import 'dart:convert';

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:http/http.dart';

class UpdateProfileRemoteService {
  Client client = Client();

  Future<Response> postUpdateProfile(
    AuthenticationHeadersRequest header,
    UpdateProfileRequest request,
  ) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchUpdateProfile,
    );
    print("URL : ${url.toString()}");
    var multipartRequest = MultipartRequest('POST', url);

    var body = HashMap<String, String>();
    body["name"] = request.name;
    body["gender"] = request.gender;
    body["placeOfBirth"] = request.placeOfBirth;
    body["dateOfBirth"] = request.dateOfBirth;
    body["jobId"] = request.jobId.toString();
    body["unitId"] = request.unitId.toString();
    body["phone"] = request.phone;
    body["email"] = request.email;
    body["villageId"] = request.villageId;
    body["address"] = request.address;
    body["subDistrictId"] = request.subDistrictId;
    body["postalCode"] = request.postalCode;
    if (request.file != null) {
      multipartRequest.files.add(
        await MultipartFile.fromPath(
          "file",
          request.file!.path,
        ),
      );
    }

    multipartRequest.headers.addAll(header.toHeader());
    multipartRequest.fields.addAll(body);

    var streamedResponse = await multipartRequest.send();
    var response = await Response.fromStream(streamedResponse);

    return response;
  }
}
