import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/riwayat_donor/riwayat_donor_data.dart';

abstract class RiwayatDonorRepository {
  Future<ResultEntity<List<RiwayatDonorData>>> fetchRiwayatDonor(
      AuthenticationHeadersRequest header);
}
