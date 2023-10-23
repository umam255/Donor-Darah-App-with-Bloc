// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:donor_darah/domain/model/info_berita/pagination_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'info_berita_pagination.g.dart';

@JsonSerializable()
class InfoBeritaPaginationResponse
    implements InfoBeritaPaginationResponseMapper {
  int? totalData;
  int? totalPage;
  int? limit;
  int? currentPage;

  InfoBeritaPaginationResponse(
      {this.totalData, this.totalPage, this.limit, this.currentPage});

  factory InfoBeritaPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoBeritaPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoBeritaPaginationResponseToJson(this);

  @override
  PaginationData toPaginationData() {
    return PaginationData(totalData!, totalPage!, limit!, currentPage!);
  }
}

abstract class InfoBeritaPaginationResponseMapper {
  PaginationData toPaginationData();
}
