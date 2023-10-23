// // ignore_for_file: avoid_print, override_on_non_overriding_member

// import 'package:donor_darah/data/base/result_entity.dart';
// import 'package:donor_darah/data/service/remote/info_berita_remote_service.dart';
// import 'package:donor_darah/domain/model/dasboard/info_berita_data.dart';
// import 'package:donor_darah/domain/repository/dasboard/info_berita_repository.dart';
// import '../../model/dasboard/info_berita_collection_remote_response.dart';

// abstract class InfoBeritaRepositoryImpl implements InfoBeritaRepository {
//   final articleRemoteService = InfoBeritaRemoteService();

//   @override
//   Future<ResultEntity<List<InfoBeritaData>>> infoBerita(
//       String page, String limit, String categoryId) async {
//     try {
//       print("FETCH 2 : REPO");
//       final response =
//           await InfoBeritaRemoteService.infoBerita(page, limit, categoryId);

//       if (response.statusCode == 200) {
//         var a = InfoBeritaCollectionRemoteResponse.fromJson(
//                     jsonDecode(response.param))
//                 .data
//                 ?.map((e) => e.toInfoBeritaData())
//                 .toList() ??
//             List.empty();

//         print("ARTICLE : ${a.length}");

//         return ResultSucces<List<InfoBeritaData>>(a);
//       } else {
//         return ResultError<List<InfoBeritaData>>();
//       }
//     } catch (e) {
//       print("ERROR : $e");
//       return ResultError(message: "Data Is Empty");
//     }
//   }
// }
