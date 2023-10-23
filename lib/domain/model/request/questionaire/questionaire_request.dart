import 'package:donor_darah/domain/model/request/questionaire/questionaire_answer_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questionaire_request.g.dart';

@JsonSerializable()
class QuestionaireRequest {
  int idSchedule;
  List<QuestionaireAnswerRequest> listAnswer;

  QuestionaireRequest(this.idSchedule, this.listAnswer);

  factory QuestionaireRequest.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireRequestToJson(this);
}
