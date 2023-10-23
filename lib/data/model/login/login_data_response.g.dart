// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : LoginDataUserResponse.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
