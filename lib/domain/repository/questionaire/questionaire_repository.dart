import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';

abstract class QuestionaireRepository {
  Future<ResultEntity> submitQuestionaire(
    AuthenticationHeadersRequest header,
    QuestionaireRequest request,
  );
}
