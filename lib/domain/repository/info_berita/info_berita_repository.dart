import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/info_berita/info_berita_data.dart';

abstract class InfoBeritaRepository {
  Future<ResultEntity<List<InfoBeritaData>>> beritaInfo(
      String page, String limit, String categoryId);
}
