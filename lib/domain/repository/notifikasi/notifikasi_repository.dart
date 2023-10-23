import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_detail_data.dart';

abstract class NotifikasiRepository {
  Future<ResultEntity<List<NotifikasiData>>> fetchNotifikasi(
    AuthenticationHeadersRequest header,
  );
}

abstract class NotifikasiDetailRepository {
  Future<ResultEntity<NotifikasiDetailData>> fetchDetailNotifikasi(
    AuthenticationHeadersRequest header,
    int id,
  );
}
