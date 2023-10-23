import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../model/request/forget_password/forget_password_request.dart';

abstract class ForgotPassRepository {
  Future<ResultEntity> submitForgotPass(ForgetPasswordRequest request);
}
