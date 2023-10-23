import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/service/remote/job/job_remote_service.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import '../../../domain/model/job/job_data.dart';
import '../../../domain/repository/job/job_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/job/job_remote_response.dart';

class JobRepositoryImpl implements JobRepository {
  final jobRemoteService = JobRemoteService();

  @override
  Future<ResultEntity<List<JobData>>> fetchJob() async {
    try {
      final response = await jobRemoteService.fetchJob();

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<JobRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<JobRemoteResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map((e) => JobRemoteResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSuccess(
            baseResponseArray.data?.map((e) => e.toJobData()).toList() ??
                List.empty(),
          );
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}
