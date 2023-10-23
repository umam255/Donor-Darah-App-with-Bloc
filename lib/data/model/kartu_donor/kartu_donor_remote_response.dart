// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:donor_darah/domain/model/kartu_donor/kartu_donor_data.dart';

part 'kartu_donor_remote_response.g.dart';

abstract class KartuDonorRemoteResponseMapper {
  KartuDonorData toKartuDonorData();
}

@JsonSerializable()
class KartuDonorRemoteResponse implements KartuDonorRemoteResponseMapper {
  int? id;
  String? name;
  String? memberCode;
  String? dateOfBirth;
  KartuDonorRemoteResponse({
    this.id,
    this.name,
    this.memberCode,
    this.dateOfBirth,
  });

  factory KartuDonorRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$KartuDonorRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KartuDonorRemoteResponseToJson(this);

  @override
  KartuDonorData toKartuDonorData() {
    return KartuDonorData(
      id ?? 0,
      name ?? '',
      memberCode ?? '',
      dateOfBirth ?? '',
    );
  }
}
