import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/upload_image/upload_image.dart';
part 'upload_image_response.g.dart';

abstract class UploadImageResponseMapper {
  UploadImage toUploadImage();
}

@JsonSerializable()
class UploadImageResponse implements UploadImageResponseMapper {
  int? id;

  UploadImageResponse({this.id});

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
  @override
  UploadImage toUploadImage() {
    return UploadImage(id);
  }
}
