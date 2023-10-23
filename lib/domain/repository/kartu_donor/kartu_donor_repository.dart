import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/kartu_donor/kartu_donor_data.dart';

abstract class KartuDonorRepository {
  Future<ResultEntity<KartuDonorData>> fetchKartuDonor(
      AuthenticationHeadersRequest header);
}
