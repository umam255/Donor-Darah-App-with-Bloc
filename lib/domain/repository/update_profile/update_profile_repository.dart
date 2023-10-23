import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';

abstract class UpdateProfileRepository {
  Future<ResultEntity> postUpdateProfile(
    AuthenticationHeadersRequest header,
    UpdateProfileRequest request,
  );
}
