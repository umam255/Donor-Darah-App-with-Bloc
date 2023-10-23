import 'package:json_annotation/json_annotation.dart';
part 'reschedule_request.g.dart';

@JsonSerializable()
class RescheduleRequest {
  int idSchedulle;

  RescheduleRequest(
    this.idSchedulle,
  );

  factory RescheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$RescheduleRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$RescheduleRequestToJson(this);
  }
}
