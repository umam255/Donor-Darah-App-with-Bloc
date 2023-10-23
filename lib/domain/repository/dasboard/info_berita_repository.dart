import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/dasboard/info_berita_data.dart';

abstract class InfoBeritaRepository {
  Future<ResultEntity<List<InfoBeritaData>>> fetchArticle(String country);
}
