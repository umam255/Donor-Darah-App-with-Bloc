import 'package:donor_darah/domain/model/agenda_detail/agenda_detail_user_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data_remote_response.g.dart';

abstract class UserDataRemoteResponseMapper {
  AgendaDetailUserData toAgendaDetailUserData();
}

@JsonSerializable()
class UserDataRemoteResponse implements UserDataRemoteResponseMapper {
  String? id;
  String? name;
  UserDataRemoteResponse({this.name, this.id});

  factory UserDataRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataRemoteResponseToJson(this);

  @override
  AgendaDetailUserData toAgendaDetailUserData() {
    return AgendaDetailUserData(id ?? '', name ?? '');
  }
}
