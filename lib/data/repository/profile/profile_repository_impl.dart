import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import '../../../domain/model/profile/profile_data.dart';
import '../../../domain/repository/profile/profile_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/profile/profile_remote_response.dart';
import '../../service/remote/profile/profile_remote_service.dart';

class ProfileRemoteRepositoryImpl implements ProfileRepository {
  final profileRemoteService = ProfileRemoteService();

  @override
  Future<ResultEntity<ProfileData>> fetchProfile(
    AuthenticationHeadersRequest header,
  ) async {
    try {
      final response = await profileRemoteService.fetchProfile(header);
      print('STATUS PROFILE :${response.statusCode}');
      print('BODY PROFILE :${response.body}');
      if (response.statusCode == 200) {
        BaseRemoteResponse<ProfileRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<ProfileRemoteResponse>.fromJson(
          jsonDecode(response.body),
          (json) =>
              ProfileRemoteResponse.fromJson(json as Map<String, dynamic>),
        );

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSuccess(baseStatusResponse.data!.toProfileData());
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
