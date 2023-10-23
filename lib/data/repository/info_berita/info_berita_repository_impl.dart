// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/service/remote/info_berita/info_berita_remote_service.dart';
import 'package:donor_darah/domain/model/info_berita/info_berita_data.dart';
import 'package:donor_darah/domain/repository/info_berita/info_berita_repository.dart';
import '../../model/info_berita/info_berita_collection_remote_response.dart';

class InfoBeritaRepositoryImpl implements InfoBeritaRepository {
  final infoBeritaRemoteService = InfoBeritaRemoteService();

  @override
  Future<ResultEntity<List<InfoBeritaData>>> beritaInfo(
      String page, String limit, String categoryId) async {
    try {
      final response =
          await infoBeritaRemoteService.infoBerita(page, limit, categoryId);

      if (response.statusCode == 200) {
        var a = InfoBeritaCollectionRemoteResponse.fromJson(
                    jsonDecode(response.body))
                .data
                ?.map((e) => e.toInfoBeritaData())
                .toList() ??
            List.empty();

        return ResultSuccess<List<InfoBeritaData>>(a);
      } else {
        return ResultError<List<InfoBeritaData>>();
      }
    } catch (e) {
      return ResultError(message: "Data Is Empty");
    }
  }
}
