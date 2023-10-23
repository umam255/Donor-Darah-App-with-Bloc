import 'dart:convert';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../domain/repository/update_profile/update_profile_repository.dart';
import '../../base/base_remote_response.dart';
import '../../service/remote/update_profile/update_profile_remote_service.dart';

class UpdateProfileRemoteRepositoryImpl implements UpdateProfileRepository {
  final updateProfileRemoteService = UpdateProfileRemoteService();

  @override
  Future<ResultEntity> postUpdateProfile(
    AuthenticationHeadersRequest header,
    UpdateProfileRequest request,
  ) async {
    print('BODY: ${request}');

    try {
      final response = await updateProfileRemoteService.postUpdateProfile(
        header,
        request,
      );
      print('STATUS CODE: ${response.statusCode}');
      print('BODY: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        return ResultSuccess('');

        // if (baseResponse.status == null) {
        //   return ResultError();
        // } else if (baseResponse.status?.code != 0) {
        //   return ResultError(message: baseResponse.status?.message);
        // } else {
        //   return ResultSuccess('');
        // }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      print('CATCH ERROR: ${e.toString()}');
      return ResultError(message: '');
    }
  }
}
