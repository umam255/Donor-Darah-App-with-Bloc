import 'package:json_annotation/json_annotation.dart';
part 'upload_image_request.g.dart';

@JsonSerializable()
class UploadImageRequest {
  dynamic file;
  String url;

  UploadImageRequest(
    this.file,
    this.url,
  );

  factory UploadImageRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadImageRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UploadImageRequestToJson(this);
  }
}
