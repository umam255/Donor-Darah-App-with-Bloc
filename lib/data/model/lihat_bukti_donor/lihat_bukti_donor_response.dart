import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/lihat_bukti_donor/lihat_bukti_donor.dart';
part 'lihat_bukti_donor_response.g.dart';

abstract class LihatBuktiDonorResponseMapper {
  LihatBuktiDonor toLihatBuktiDonor();
}

@JsonSerializable()
class LihatBuktiDonorResponse implements LihatBuktiDonorResponseMapper {
  int? id;
  String? url;

  LihatBuktiDonorResponse({this.id, this.url});

  factory LihatBuktiDonorResponse.fromJson(Map<String, dynamic> json) =>
      _$LihatBuktiDonorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LihatBuktiDonorResponseToJson(this);
  @override
  LihatBuktiDonor toLihatBuktiDonor() {
    return LihatBuktiDonor(id, url ?? "");
  }
}
