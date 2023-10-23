// import 'dart:convert';
// import 'package:donor_darah/domain/model/request/register/register_request.dart';
// import 'package:donor_darah/base/result_entity/result_entity.dart';
// import '../../../domain/model/agenda/unit_data.dart';
// import '../../../domain/repository/unit/unit_repository.dart';
// import '../../base/base_remote_response.dart';
// import '../../model/unit/unit_remote_response.dart';
// import '../../service/remote/register/register_remote_service.dart';

// class UnitRepositoryImpl implements UnitRepository {
//   final unitRemoteService = RegisterRemoteService();

//   @override
//   Future<ResultEntity<List<UnitData>>> fetchUnit(
//       RegisterRequest request) async {
//     try {
//       final response = await unitRemoteService.fetchUnit(request);

//       if (response.statusCode == 200) {
//         BaseRemoteResponse<List<UnitRemoteResponse>> baseResponseArray =
//             BaseRemoteResponse<List<UnitRemoteResponse>>.fromJson(
//                 jsonDecode(response.body),
//                 (json) => (json as List)
//                     .map((e) =>
//                         UnitRemoteResponse.fromJson(e as Map<String, dynamic>))
//                     .toList());
//         if (baseResponseArray.status == null) {
//           return ResultError(message: baseResponseArray.status?.message);
//         } else if (baseResponseArray.status?.code != 0) {
//           return ResultError(message: baseResponseArray.status?.message);
//         } else {
//           return ResultSuccess(
//               baseResponseArray.data?.map((e) => e.toUnitData()).toList() ??
//                   List.empty());
//         }
//       } else {
//         return ResultError<List<UnitData>>(message: "");
//       }
//     } catch (e) {
//       return ResultError(message: "");
//     }
//   }
// }
