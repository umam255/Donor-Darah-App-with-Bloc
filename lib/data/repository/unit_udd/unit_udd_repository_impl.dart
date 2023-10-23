import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/unit_udd/unit_udd_response.dart';
import 'package:donor_darah/data/service/remote/unit_udd/unit_udd_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/unit_udd/unit_udd_data.dart';
import 'package:donor_darah/domain/repository/unit_udd/unit_udd_repository.dart';

class UnitUddRepositoryImpl implements UnitUddRepository {
  final unitUddService = UnitUddService();

  @override
  Future<ResultEntity<List<UnitUddData>>> fetchUnitUdd() async {
    try {
      final response = await unitUddService.fetchUnitUdd();

      print("Status Code : ${response.statusCode}");

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<UnitUddDataResponse>> baseResponse =
            BaseRemoteResponse<List<UnitUddDataResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map((e) =>
                  UnitUddDataResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

        UnitUddDataResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data?.map((e) => e.toUnitUddData()).toList() ??
                List.empty(),
          );
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}
