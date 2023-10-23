import 'package:donor_darah/data/model/riwayat_donor/riwayat_donor_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/riwayat_donor/riwayat_donor_data.dart';
part 'riwayat_donor_collection_remote_response.g.dart';

abstract class RiwayatDonorCollectionRemoteResponseMapper {
  List<RiwayatDonorData> toRiwayatDonorData();
}

@JsonSerializable()
class RiwayatDonorCollectionRemoteResponse
    implements RiwayatDonorCollectionRemoteResponseMapper {
  @JsonKey(name: 'Status')
  String? status;
  @JsonKey(name: 'Data')
  List<RiwayatDonorRemoteResponse>? data;

  RiwayatDonorCollectionRemoteResponse({
    this.status,
    this.data,
  });

  factory RiwayatDonorCollectionRemoteResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RiwayatDonorCollectionRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RiwayatDonorCollectionRemoteResponseToJson(this);

  @override
  List<RiwayatDonorData> toRiwayatDonorData() {
    return data?.map((e) => e.toRiwayatDonorData()).toList() ?? List.empty();
  }
}
