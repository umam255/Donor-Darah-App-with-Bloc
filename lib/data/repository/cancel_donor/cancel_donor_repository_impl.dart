import 'dart:convert';

import '../../../base/result_entity/result_entity.dart';
import '../../../domain/base/authentication_headers_request.dart';
import '../../../domain/repository/cancel_donor/cancel_donor_repository.dart';
import '../../base/base_remote_response.dart';
import '../../service/remote/cancel_donor/cancel_donor_service.dart';

class CancelDonorRepositoryImpl implements CancelDonorRepository {
  final cancelDonorRemoteService = CancelDonorService();

  @override
  Future<ResultEntity> putCancelDonor(
      String donorRegisterId, AuthenticationHeadersRequest header) async {
    try {
      final response = await cancelDonorRemoteService.putCancelDonor(
        donorRegisterId,
        header,
      );
      print('STATUS CANCEL:${response.statusCode}');
      if (response.statusCode == 200) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        if (baseResponse.status == null) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data);
        }
      } else {
        return ResultError(message: 'cancel donor error');
      }
    } catch (e) {
      return ResultError(message: 'cancel donor error');
    }
  }
}
