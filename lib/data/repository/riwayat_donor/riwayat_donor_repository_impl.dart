import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/riwayat_donor/riwayat_donor_remote_response.dart';

import 'package:donor_darah/data/service/remote/riwayat_donor/riwayat_donor_remote_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/riwayat_donor/riwayat_donor_data.dart';
import 'package:donor_darah/domain/repository/riwayat_donor/riwayat_donor_repository.dart';

class RiwayatDonorRemoteRepositoryImpl implements RiwayatDonorRepository {
  final riwayatDonorRemoteService = RiwayatDonorRemoteService();

  @override
  Future<ResultEntity<List<RiwayatDonorData>>> fetchRiwayatDonor(
    AuthenticationHeadersRequest header,
  ) async {
    try {
      final response =
          await riwayatDonorRemoteService.fetchRiwayatDonor(header);

      print('STATUS RIWAYAT :${response.statusCode}');

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<RiwayatDonorRemoteResponse>> baseResponse =
            BaseRemoteResponse<List<RiwayatDonorRemoteResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) => RiwayatDonorRemoteResponse.fromJson(
                    e as Map<String, dynamic>),
              )
              .toList(),
        );

        RiwayatDonorRemoteResponse.fromJson(jsonDecode(response.body));
        // print('ERROR');
        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(
            baseResponse.data!.map((e) => e.toRiwayatDonorData()).toList(),
          );
        }
      } else {
        // print('Berhasl');
        return ResultError(message: "");
      }
    } catch (e) {
      print("CATH : ${e.toString()}");
      return ResultError(message: "Data Not Found");
    }
  }
}
