import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/refreh_token/refresh_token_data.dart';

abstract class RefreshTokenRepository {
  Future<ResultEntity<RefreshTokenData>> postRefreshToken(
    AuthenticationHeadersRequest header,
  );
}
