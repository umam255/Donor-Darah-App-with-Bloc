import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/update_profile/update_profile_data.dart';

part 'update_profile_remote_response.g.dart';

@JsonSerializable()
class UpdateProfileRemoteResponse implements UpdateProfileRemoteResponseMapper {
  int? id;
  UpdateProfileRemoteResponse({
    this.id,
  });

  factory UpdateProfileRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRemoteResponseToJson(this);

  @override
  UpdateProfileData toUpdateProfileData() {
    return UpdateProfileData();
  }
}

abstract class UpdateProfileRemoteResponseMapper {
  UpdateProfileData toUpdateProfileData();
}
