import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/agenda/user_data.dart';

part 'user_data_remote_response.g.dart';

abstract class UserDataRemoteResponseMapper {
  UserData toUserData();
}

@JsonSerializable()
class UserDataRemoteResponse implements UserDataRemoteResponseMapper {
  String? name;
  UserDataRemoteResponse({this.name});

  factory UserDataRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataRemoteResponseToJson(this);

  @override
  UserData toUserData() {
    return UserData(name ?? "");
  }
}
