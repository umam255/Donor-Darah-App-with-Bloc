import 'package:donor_darah/domain/model/register/register_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_remote_respon.g.dart';

abstract class RegisterRemoteResponseMapper {
  RegisterData toRegisterData();
}

@JsonSerializable()
class RegisterRemoteResponse implements RegisterRemoteResponseMapper {
  int? id;
  RegisterRemoteResponse({
    this.id,
  });

  factory RegisterRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRemoteResponseToJson(this);

  @override
  RegisterData toRegisterData() {
    return RegisterData(id: id);
  }
}
