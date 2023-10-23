import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/cancel_donor/cancel_donor.dart';
part 'cancel_donor_response.g.dart';

abstract class CancelDonorResponseMapper {
  CancelDonor toCancelDonor();
}

@JsonSerializable()
class CancelDonorResponse implements CancelDonorResponseMapper {
  int? id;

  CancelDonorResponse({this.id});

  factory CancelDonorResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelDonorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelDonorResponseToJson(this);
  @override
  CancelDonor toCancelDonor() {
    return CancelDonor(id);
  }
}
