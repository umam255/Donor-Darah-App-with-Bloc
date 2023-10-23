import 'package:donor_darah/domain/model/riwayat_donor/riwayat_donor_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'riwayat_donor_remote_response.g.dart';

abstract class RiwayatDonorRemoteResponseMapper {
  RiwayatDonorData toRiwayatDonorData();
}

@JsonSerializable()
class RiwayatDonorRemoteResponse implements RiwayatDonorRemoteResponseMapper {
  int? id;
  String? name;
  String? date;
  String? type;
  String? donorProof;
  RiwayatDonorRemoteResponse({
    this.date,
    this.donorProof,
    this.id,
    this.name,
    this.type,
  });

  factory RiwayatDonorRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$RiwayatDonorRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RiwayatDonorRemoteResponseToJson(this);

  @override
  RiwayatDonorData toRiwayatDonorData() {
    return RiwayatDonorData(
      date ?? '',
      donorProof ?? '',
      id ?? 0,
      name ?? '',
      type ?? '',
    );
  }
}
