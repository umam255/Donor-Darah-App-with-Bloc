import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';

abstract class LoginRepository {
  Future<ResultEntity<LoginData>> submitLogin(LoginRequest request);
}
