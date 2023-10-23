// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthenticationHeadersRequest {
  String accesToken;
  AuthenticationHeadersRequest(
    this.accesToken,
  );

  Map<String, String> toHeader() {
    return {
      'Authorization': 'Bearer $accesToken',
    };
  }
}

class AuthenticationHeadersRequestUpload {
  String accesToken;
  AuthenticationHeadersRequestUpload(
    this.accesToken,
  );

  Map<String, String> toHeader() {
    return {
      'Authorization': 'Bearer $accesToken',
      // 'Content-Type': 'multipart/form-data',
    };
  }
}
