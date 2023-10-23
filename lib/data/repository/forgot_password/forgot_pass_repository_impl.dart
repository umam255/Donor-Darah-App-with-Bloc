import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/service/remote/forgot_password/forgot_pass_service.dart';
import 'package:donor_darah/domain/repository/forgot_password/forgot_pass_repository.dart';
import '../../../domain/model/request/forget_password/forget_password_request.dart';

class ForgotPassRepositoryImpl implements ForgotPassRepository {
  final forgotPassService = ForgotPassService();

  @override
  Future<ResultEntity> submitForgotPass(ForgetPasswordRequest request) async {
    try {
      final response = await forgotPassService.postForgotPass(request);

      print("STATUS CODE FORGET PASSWORD : ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data);
        }
      } else {
        print("ini error forget password : ${response.body}");
        return ResultError(message: response.body);
      }
    } catch (e) {
      print("ini error forget password e : ${e.toString()}");

      return ResultError(message: "");
    }
  }
}
