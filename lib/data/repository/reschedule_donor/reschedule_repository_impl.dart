import 'dart:convert';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/reschedule_donor/reschedule_request.dart';
import '../../../base/result_entity/result_entity.dart';
import '../../../domain/model/reschedule_donor/reschedule_donor.dart';
import '../../../domain/repository/reschedule_donor/reschedule_donor_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/reschedule_donor/reschedule_donor_response.dart';
import '../../service/remote/reschedule_donor/reschedule_donor_service.dart';

class RescheduleDonorRepositoryImpl implements RescheduleDonorRepository {
  final rescheduleDonorRemoteService = RescheduleDonorService();

  @override
  Future<ResultEntity> postReschedule(
    String idAgenda,
    int idSchedule,
    AuthenticationHeadersRequest header,
  ) async {
    try {
      final response = await rescheduleDonorRemoteService.postReschedule(
        idAgenda,
        idSchedule,
        header,
      );
      print("STATUS RESCHEDULE : ${response.statusCode}");
      print("RESPONSE RESCHEDULE : ${response.body}");

      if (response.statusCode == 200) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
          jsonDecode(response.body),
          (json) => null,
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data);
        }
      } else {
        return ResultError(message: 'Reschedule gagal');
      }
    } catch (e) {
      return ResultError(message: 'Reschedule gagal');
    }
  }
}
