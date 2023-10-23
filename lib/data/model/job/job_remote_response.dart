// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:donor_darah/domain/model/job/job_data.dart';

part 'job_remote_response.g.dart';

abstract class JobRemoteResponseMapper {
  JobData toJobData();
}

@JsonSerializable()
class JobRemoteResponse implements JobRemoteResponseMapper {
  int? id;
  String? name;
  String? updatedAt;
  String? createdAt;
  JobRemoteResponse({
    this.id,
    this.name,
    this.updatedAt,
    this.createdAt,
  });

  factory JobRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$JobRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobRemoteResponseToJson(this);

  @override
  JobData toJobData() {
    return JobData(id ?? 0, name ?? '', updatedAt ?? '', createdAt ?? '');
  }
}
