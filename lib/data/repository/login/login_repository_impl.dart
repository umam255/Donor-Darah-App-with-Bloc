import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/login/login_data_response.dart';
import 'package:donor_darah/data/service/remote/login/login_remote_service.dart';
import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:donor_darah/domain/repository/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final loginRemoteService = LoginRemoteService();

  @override
  Future<ResultEntity<LoginData>> submitLogin(LoginRequest request) async {
    try {
      final response = await loginRemoteService.postLogin(request);

      print("STATUS CODE: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 500) {
        BaseRemoteResponse<LoginDataResponse> baseResponse =
            BaseRemoteResponse<LoginDataResponse>.fromJson(
          jsonDecode(response.body),
          (json) => LoginDataResponse.fromJson(json as Map<String, dynamic>),
        );

        LoginDataResponse.fromJson(
          jsonDecode(response.body),
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data!.toLoginData());
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
