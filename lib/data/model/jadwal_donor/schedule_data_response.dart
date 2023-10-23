// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_schedule_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'schedule_data_response.g.dart';

abstract class ScheduleDataResponseMapper {
  ScheduleScheduleData toScheduleScheduleData();
}

@JsonSerializable()
class ScheduleDataResponse implements ScheduleDataResponseMapper {
  int? id;
  String? name;
  String? address;
  String? timeStart;
  String? timeEnd;
  String? type;

  ScheduleDataResponse({
    this.id,
    this.name,
    this.address,
    this.timeStart,
    this.timeEnd,
    this.type,
  });

  factory ScheduleDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDataResponseToJson(this);

  @override
  ScheduleScheduleData toScheduleScheduleData() {
    return ScheduleScheduleData(
      id ?? 0,
      name ?? "",
      address ?? "",
      timeStart ?? "",
      timeEnd ?? "",
      type ?? "",
    );
  }
}
