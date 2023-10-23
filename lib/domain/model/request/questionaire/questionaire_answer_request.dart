// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'questionaire_answer_request.g.dart';

@JsonSerializable()
class QuestionaireAnswerRequest {
  String questionCode;
  dynamic answer;

  QuestionaireAnswerRequest(
    this.questionCode,
    this.answer,
  );

  factory QuestionaireAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$QuestionaireAnswerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionaireAnswerRequestToJson(this);
}
