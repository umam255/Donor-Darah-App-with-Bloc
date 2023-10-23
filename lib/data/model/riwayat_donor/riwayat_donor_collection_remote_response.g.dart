// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_donor_collection_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatDonorCollectionRemoteResponse
    _$RiwayatDonorCollectionRemoteResponseFromJson(Map<String, dynamic> json) =>
        RiwayatDonorCollectionRemoteResponse(
          status: json['Status'] as String?,
          data: (json['Data'] as List<dynamic>?)
              ?.map((e) => RiwayatDonorRemoteResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RiwayatDonorCollectionRemoteResponseToJson(
        RiwayatDonorCollectionRemoteResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Data': instance.data,
    };
