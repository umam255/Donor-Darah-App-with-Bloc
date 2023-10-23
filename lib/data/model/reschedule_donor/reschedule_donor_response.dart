import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/reschedule_donor/reschedule_donor.dart';
part 'reschedule_donor_response.g.dart';

abstract class RescheduleDonorResponseMapper {
  RescheduleDonor toRescheduleDonor();
}

@JsonSerializable()
class RescheduleDonorResponse implements RescheduleDonorResponseMapper {
  int? id;

  RescheduleDonorResponse({this.id});

  factory RescheduleDonorResponse.fromJson(Map<String, dynamic> json) =>
      _$RescheduleDonorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RescheduleDonorResponseToJson(this);
  @override
  RescheduleDonor toRescheduleDonor() {
    return RescheduleDonor(id);
  }
}
