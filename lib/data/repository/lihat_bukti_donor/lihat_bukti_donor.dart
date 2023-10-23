import 'dart:convert';
import '../../../base/result_entity/result_entity.dart';
import '../../../domain/base/authentication_headers_request.dart';
import '../../../domain/model/lihat_bukti_donor/lihat_bukti_donor.dart';
import '../../../domain/repository/lihat_bukti_donor/lihat_bukti_donor_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/lihat_bukti_donor/lihat_bukti_donor_response.dart';
import '../../service/remote/lihat_bukti_donor/lihat_bukti_donor_service.dart';

class LihatBuktiDonorRepositoryImpl implements LihatBuktiDonorRepository {
  final lihatBuktiDonorRemoteService = LihatBuktiDonorService();

  @override
  Future<ResultEntity<LihatBuktiDonor>> fetchLihatBuktiDonor(
    AuthenticationHeadersRequest header,
    String idRiwayat,
  ) async {
    try {
      final response = await lihatBuktiDonorRemoteService.fetchLihatBuktiDonor(
        header,
        idRiwayat,
      );

      print("STATUS  BUKTI DONOR : ${response.statusCode}");

      if (response.statusCode == 200) {
        BaseRemoteResponse<LihatBuktiDonorResponse> baseResponse =
            BaseRemoteResponse<LihatBuktiDonorResponse>.fromJson(
          jsonDecode(response.body),
          (json) =>
              LihatBuktiDonorResponse.fromJson(json as Map<String, dynamic>),
        );

        LihatBuktiDonorResponse.fromJson(
          jsonDecode(response.body),
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data!.toLihatBuktiDonor());
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
