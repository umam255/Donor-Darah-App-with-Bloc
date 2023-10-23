import 'package:donor_darah/domain/model/info_berita/info_berita_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'info_berita_response.dart';

part 'info_berita_collection_remote_response.g.dart';

@JsonSerializable()
class InfoBeritaCollectionRemoteResponse
    implements InfoBeritaCollectionRemoteResponseMapper {
  String? status;
  String? pagination;

  List<InfoBeritaRemoteResponse>? data;

  InfoBeritaCollectionRemoteResponse({this.status, this.data, this.pagination});

  factory InfoBeritaCollectionRemoteResponse.fromJson(
          Map<String, dynamic> json) =>
      _$InfoBeritaCollectionRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InfoBeritaCollectionRemoteResponseToJson(this);

  @override
  List<InfoBeritaData> toInfoBeritaData() {
    return data?.map((e) => e.toInfoBeritaData()).toList() ?? List.empty();
  }
}

abstract class InfoBeritaCollectionRemoteResponseMapper {
  List<InfoBeritaData> toInfoBeritaData();
}
