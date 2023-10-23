import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/profile/profile_data.dart';

abstract class ProfileRepository {
  Future<ResultEntity<ProfileData>> fetchProfile(
      AuthenticationHeadersRequest header);
}
