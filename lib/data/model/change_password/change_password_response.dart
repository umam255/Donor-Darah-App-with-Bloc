import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/change_password/change_pasword.dart';
part 'change_password_response.g.dart';

abstract class ChangePasswordResponseMapper {
  ChangePassword toChangePassword();
}

@JsonSerializable()
class ChangePasswordResponse implements ChangePasswordResponseMapper {
  int? id;

  ChangePasswordResponse({this.id});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
  @override
  ChangePassword toChangePassword() {
    return ChangePassword(id);
  }
}
