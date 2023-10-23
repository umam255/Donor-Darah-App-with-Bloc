import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../base/authentication_headers_request.dart';
import '../../model/lihat_bukti_donor/lihat_bukti_donor.dart';

abstract class LihatBuktiDonorRepository {
  Future<ResultEntity<LihatBuktiDonor>> fetchLihatBuktiDonor(
    AuthenticationHeadersRequest header,
    String idRiwayat,
  );
}
