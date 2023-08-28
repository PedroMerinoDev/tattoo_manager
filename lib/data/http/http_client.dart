/*
abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  });
}*/

abstract class HttpClient {
  Future<void>? request(
      {required String url, required String method, required Map body}) async {}
}
