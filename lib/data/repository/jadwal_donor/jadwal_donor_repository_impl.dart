import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/jadwal_donor/schedule_collection_response.dart';
import 'package:donor_darah/data/service/remote/jadwal_donor/jadwal_donor_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';
import 'package:donor_darah/domain/repository/jadwal_donor/jadwal_donor_repository.dart';

class JadwalDonorRepositoryImpl implements JadwalDonorRepository {
  final jadwalDonorService = JadwalDonorService();

  @override
  Future<ResultEntity<List<ScheduleData>>> fetchSchedule(
      AuthenticationHeadersRequest header, int unitId) async {
    try {
      final response = await jadwalDonorService.fetchSchedule(header, unitId);

      print("STATUS CODE JADWAL DONOR :${response.statusCode} ");
      print("DATA JADWAL DONOR :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<List<ScheduleCollectionResponse>> baseResponse =
            BaseRemoteResponse<List<ScheduleCollectionResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) => ScheduleCollectionResponse.fromJson(
                    e as Map<String, dynamic>),
              )
              .toList(),
        );

        ScheduleCollectionResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data!.map((e) => e.toScheduleData()).toList(),
          );
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      return ResultError(message: e.toString());
    }
  }
}
