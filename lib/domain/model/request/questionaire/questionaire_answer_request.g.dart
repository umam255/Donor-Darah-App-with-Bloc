// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionaire_answer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionaireAnswerRequest _$QuestionaireAnswerRequestFromJson(
        Map<String, dynamic> json) =>
    QuestionaireAnswerRequest(
      json['questionCode'] as String,
      json['answer'],
    );

Map<String, dynamic> _$QuestionaireAnswerRequestToJson(
        QuestionaireAnswerRequest instance) =>
    <String, dynamic>{
      'questionCode': instance.questionCode,
      'answer': instance.answer,
    };
