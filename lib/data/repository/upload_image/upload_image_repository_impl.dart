import 'dart:convert';
import 'dart:io';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';
import '../../../base/result_entity/result_entity.dart';
import '../../../domain/repository/upload_image/upload_image_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/upload_image/upload_image_response.dart';
import '../../service/remote/upload_image/upload_image_service.dart';

class UploadImageRepositoryImpl implements UploadImageRepository {
  final uploadImageRemoteService = UploadImageService();

  @override
  Future<ResultEntity> postUploadImage(
    AuthenticationHeadersRequestUpload header,
    File image,
    String idRiwayat,
  ) async {
    try {
      final response = await uploadImageRemoteService.postUploadImage(
        header,
        image,
        idRiwayat,
      );

      print("STATUS UPLOAD IMAGE: ${response.statusCode}");
      print("BODY UPLOAD IMAGE: ${response.body}");
      print("RESPONSE HEADERS: ${response.headers}");

      if (response.statusCode == 200) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        UploadImageResponse.fromJson(
          jsonDecode(response.body),
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess('');
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
