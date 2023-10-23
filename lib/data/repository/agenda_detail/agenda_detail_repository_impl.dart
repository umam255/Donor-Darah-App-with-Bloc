import 'dart:convert';

import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/agenda_detail/agenda_detail_remote_response.dart';
import 'package:donor_darah/data/service/remote/agenda_detail/agenda_detail_remote_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_data.dart';
import 'package:donor_darah/domain/repository/agenda_detail/agenda_detail_repository.dart';

class AgendaDetailRepositoryImpl implements AgendaDetailRepository {
  final agendaDetailRepository = AgendaDetailRemoteService();

  @override
  Future<ResultEntity<AgendaDetailData>> fetchDetailAgenda(
    AuthenticationHeadersRequest header,
    String idAgenda,
  ) async {
    try {
      final response =
          await agendaDetailRepository.fetchDetailAgenda(header, idAgenda);

      print("STATUS-CODE DETAIL-AGENDA : ${response.statusCode}");

      if (response.statusCode == 200) {
        BaseRemoteResponse<AgendaDetailRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<AgendaDetailRemoteResponse>.fromJson(
          jsonDecode(response.body),
          (json) => AgendaDetailRemoteResponse.fromJson(
            json as Map<String, dynamic>,
          ),
        );

        if (baseStatusResponse.status == null) {
          print('INI ERROR 1');
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          print('INI ERROR 1');
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          print('INI SUCCESS');
          return ResultSuccess(baseStatusResponse.data!.toAgendaDetailData());
        }
      } else {
        print('INI ERROR 3');
        return ResultError(message: '');
      }
    } catch (e) {
      print('INI ERROR 4');
      return ResultError(message: '');
    }
  }
}
