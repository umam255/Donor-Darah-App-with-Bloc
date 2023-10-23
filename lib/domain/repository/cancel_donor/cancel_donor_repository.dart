import '../../../base/result_entity/result_entity.dart';
import '../../base/authentication_headers_request.dart';

abstract class CancelDonorRepository {
  Future<ResultEntity> putCancelDonor(
      String donorRegisterId, AuthenticationHeadersRequest header);
}
