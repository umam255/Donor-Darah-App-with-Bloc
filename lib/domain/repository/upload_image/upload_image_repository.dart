import 'dart:io';

import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import '../../../base/result_entity/result_entity.dart';

abstract class UploadImageRepository {
  Future<ResultEntity> postUploadImage(
    AuthenticationHeadersRequestUpload header,
    File image,
    String idRiwayat,
  );
}
