// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notifikasi_remote_response.g.dart';

abstract class NotifikasiRemoteResponseMapper {
  NotifikasiData toNotifikasiData();
}

@JsonSerializable()
class NotifikasiRemoteResponse extends NotifikasiRemoteResponseMapper {
  int? id;
  String? desc;
  String? status;
  String? title;
  String? createdAt;
  NotifikasiRemoteResponse({
    this.id,
    this.desc,
    this.status,
    this.title,
    this.createdAt,
  });

  factory NotifikasiRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifikasiRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifikasiRemoteResponseToJson(this);

  @override
  NotifikasiData toNotifikasiData() {
    return NotifikasiData(
      id ?? 0,
      desc ?? '',
      status ?? '',
      title ?? '',
      createdAt ?? '',
    );
  }
}
