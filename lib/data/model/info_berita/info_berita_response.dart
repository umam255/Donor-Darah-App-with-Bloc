// ignore_for_file: non_constant_identifier_names

import 'package:donor_darah/domain/model/info_berita/info_berita_data.dart';

import 'package:json_annotation/json_annotation.dart';

import 'info_berita_pagination.dart';
part 'info_berita_response.g.dart';

@JsonSerializable()
class InfoBeritaRemoteResponse implements InfoBeritaRemoteResponseMapper {
  String? uuid;
  String? title;
  String? image;
  String? createdAt;

  InfoBeritaPaginationResponse? Pagination;

  InfoBeritaRemoteResponse({
    this.uuid,
    this.title,
    this.image,
    this.createdAt,
    this.Pagination,
  });
  factory InfoBeritaRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoBeritaRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InfoBeritaRemoteResponseToJson(this);
  @override
  InfoBeritaData toInfoBeritaData() {
    return InfoBeritaData(
      uuid ?? "",
      title ?? "",
      image ?? "",
      createdAt ?? "",
    );
  }
}

abstract class InfoBeritaRemoteResponseMapper {
  InfoBeritaData toInfoBeritaData();
}
