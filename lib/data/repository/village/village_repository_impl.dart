import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../domain/model/village/village_data.dart';
import '../../../domain/repository/village/village_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/village/village_remote_response.dart';
import '../../service/remote/village/village_remote_service.dart';

class VillageRepositoryImpl implements VillageRepository {
  final villageRemoteService = VillageRemoteService();

  @override
  Future<ResultEntity<List<VillageData>>> fetchVillage(
      String? subDistrictId) async {
    try {
      final response = await villageRemoteService.fetchVillage(subDistrictId);
      print('STATUS CODE : VILLAGE ${response.statusCode}');
      if (response.statusCode == 200) {
        BaseRemoteResponse<List<VillageRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<VillageRemoteResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) =>
                    VillageRemoteResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        );
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSuccess(
            baseResponseArray.data?.map((e) => e.toVillageData()).toList() ??
                List.empty(),
          );
        }
      } else {
        return ResultError<List<VillageData>>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}
