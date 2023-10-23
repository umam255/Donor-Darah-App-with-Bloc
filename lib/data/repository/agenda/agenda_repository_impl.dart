import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/agenda/agenda_remote_response.dart';
import 'package:donor_darah/data/service/remote/agenda/agenda_remote_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/agenda/agenda_data.dart';
import 'package:donor_darah/domain/repository/agenda/agenda_repository.dart';

class AgendaRemoteRepositoryImpl implements AgendaRepository {
  final agendaRemoteService = AgendaRemoteService();

  @override
  Future<ResultEntity<List<AgendaData>>> fetchAgenda(
    AuthenticationHeadersRequest header,
  ) async {
    try {
      final response = await agendaRemoteService.fetchAgenda(header);
      print('STATUS CODE AGENDA: ${response.statusCode}');
      if (response.statusCode == 200) {
        BaseRemoteResponse<List<AgendaRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<AgendaRemoteResponse>>.fromJson(
          jsonDecode(response.body),
          (json) => (json as List)
              .map(
                (e) => AgendaRemoteResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        );

        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSuccess(
            baseResponseArray.data?.map((e) => e.toAgendaData()).toList() ??
                List.empty(),
          );
        }
      } else {
        return ResultError(message: '');
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}
