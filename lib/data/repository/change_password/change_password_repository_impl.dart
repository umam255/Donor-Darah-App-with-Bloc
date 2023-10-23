import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/service/remote/change_password/change_password_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/change_password/change_password_request.dart';
import 'package:donor_darah/domain/repository/change_password/change_password_repository.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final changePasswordRemoteService = ChangePasswordService();

  @override
  Future<ResultEntity> postChangePassword(
    AuthenticationHeadersRequest header,
    ChangePasswordRequest request,
  ) async {
    try {
      final response = await changePasswordRemoteService.postChangePassword(
        header,
        request,
      );

      print("STATUS  CHANGE PASSWORD: ${response.statusCode}");
      print("BODY : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data);
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
