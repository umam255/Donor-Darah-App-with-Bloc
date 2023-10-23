import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import '../../model/request/change_password/change_password_request.dart';

abstract class ChangePasswordRepository {
  Future<ResultEntity> postChangePassword(
    AuthenticationHeadersRequest header,
    ChangePasswordRequest request,
  );
}
