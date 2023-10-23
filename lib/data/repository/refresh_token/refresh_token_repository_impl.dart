import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/login/login_data_response.dart';
import 'package:donor_darah/data/model/refresh_token/refresh_token_response.dart';
import 'package:donor_darah/data/service/remote/refresh_token/refresh_token_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/refreh_token/refresh_token_data.dart';
import 'package:donor_darah/domain/repository/refresh_token/refresh_token_repository.dart';

class RefreshTokenRepositoryImpl implements RefreshTokenRepository {
  final refreshTokenRemoteService = RefreshTokenRemoteService();

  @override
  Future<ResultEntity<RefreshTokenData>> postRefreshToken(
    AuthenticationHeadersRequest header,
  ) async {
    try {
      final response = await refreshTokenRemoteService.postRefrehToken(header);

      print("STATUS CODE: ${response.statusCode}");

      if (response.statusCode == 200) {
        BaseRemoteResponse<RefreshTokenResponse> baseResponse =
            BaseRemoteResponse<RefreshTokenResponse>.fromJson(
          jsonDecode(response.body),
          (json) => RefreshTokenResponse.fromJson(json as Map<String, dynamic>),
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
          return ResultSuccess(baseResponse.data!.toRefreshTokenData());
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
