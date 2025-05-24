class HttpRequestParamDTO {
  final String path;
  final Map<String, dynamic> queryParameters;
  final Map<String, dynamic> body;
  final Map<String, dynamic> headers;

  HttpRequestParamDTO({
    required this.path,
    this.queryParameters = const {},
    this.body = const {},
    this.headers = const {},
  });
}
