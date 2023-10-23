import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/district/district_remote_response.dart';
import 'package:donor_darah/data/service/remote/district/district_remote_service.dart';
import 'package:donor_darah/domain/repository/district/district_repository.dart';
import '../../../domain/model/district/district.dart';

class DistrictRepositoryImpl implements DistrictRepository {
  final districtRemoteService = DistrictRemoteService();

  @override
  Future<ResultEntity<List<DistrictData>>> fetchDistrict() async {
    try {
      final response = await districtRemoteService.fetchDistrict();
      print('STATUS CODE DISTRICT: ${response.statusCode}');
      if (response.statusCode == 200) {
        // print('ERRROR ${response.body}');
        BaseRemoteResponse<List<DistrictRemoteResponse>> baseResponse =
            BaseRemoteResponse<List<DistrictRemoteResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map((e) =>
                  DistrictRemoteResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

        DistrictRemoteResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data?.map((e) => e.toDistrictData()).toList() ??
                List.empty(),
          );
        }
      } else {
        return ResultError<List<DistrictData>>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}
