class HttpRequestDTO {
  final Uri uri;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> body;

  HttpRequestDTO({
    required this.uri,
    this.headers = const {},
    this.body = const {},
  });
}
