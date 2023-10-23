// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:donor_darah/domain/model/data/refreh_token/refresh_token_data.dart';

part 'refresh_token_response.g.dart';

abstract class RefreshTokenResponseMapper {
  RefreshTokenData toRefreshTokenData();
}

@JsonSerializable()
class RefreshTokenResponse implements RefreshTokenResponseMapper {
  String? token;
  RefreshTokenResponse({
    this.token,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);

  @override
  RefreshTokenData toRefreshTokenData() {
    return RefreshTokenData(token ?? '');
  }
}
