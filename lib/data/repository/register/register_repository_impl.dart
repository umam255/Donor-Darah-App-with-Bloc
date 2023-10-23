// ignore_for_file: avoid_print, override_on_non_overriding_member
import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';

import '../../../domain/model/request/register/register_request.dart';
import '../../../domain/repository/register/register_repository.dart';
import '../../service/remote/register/register_remote_service.dart';

class RegisterRemoteRepositoryImpl implements RegisterRepository {
  final registerRemoteService = RegisterRemoteService();

  @override
  Future<ResultEntity> postRegister(RegisterRequest request) async {
    try {
      final response = await registerRemoteService.postRegister(request);
      print("STATUS CODE REG: ${response.statusCode}");
      print("ERROR REG: ${response.body}");
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 500) {
        BaseRemoteResponse baseStatusResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSuccess(baseStatusResponse.data);
        }
      } else {
        return ResultError(message: (response.body));
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}
