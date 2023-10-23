// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionaire_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionaireRequest _$QuestionaireRequestFromJson(Map<String, dynamic> json) =>
    QuestionaireRequest(
      json['idSchedule'] as int,
      (json['listAnswer'] as List<dynamic>)
          .map((e) =>
              QuestionaireAnswerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionaireRequestToJson(
        QuestionaireRequest instance) =>
    <String, dynamic>{
      'idSchedule': instance.idSchedule,
      'listAnswer': instance.listAnswer,
    };
