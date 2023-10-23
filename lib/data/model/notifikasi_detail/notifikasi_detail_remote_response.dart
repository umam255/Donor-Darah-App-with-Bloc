// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_detail_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notifikasi_detail_remote_response.g.dart';

abstract class NotifikasiDetailRemoteResponseMapper {
  NotifikasiDetailData toNotifikasiDetailData();
}

@JsonSerializable()
class NotifikasiDetailRemoteResponse
    extends NotifikasiDetailRemoteResponseMapper {
  int? id;
  String? desc;
  String? status;
  String? title;
  String? createdAt;
  NotifikasiDetailRemoteResponse({
    this.id,
    this.desc,
    this.status,
    this.title,
    this.createdAt,
  });

  factory NotifikasiDetailRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifikasiDetailRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifikasiDetailRemoteResponseToJson(this);

  @override
  NotifikasiDetailData toNotifikasiDetailData() {
    return NotifikasiDetailData(
      id ?? 0,
      title ?? '',
      desc ?? '',
      status ?? '',
      createdAt ?? '',
    );
  }
}
