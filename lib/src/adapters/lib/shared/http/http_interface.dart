import 'package:adapters/shared/http/dto/http_request_dto.dart';
import 'package:dio/dio.dart';

class HttpInterface {
  final Dio dio;

  HttpInterface(this.dio);

  Future<Response> get(HttpRequestDTO request) async {
    return await dio.getUri(
      request.uri,
      options: Options(headers: request.headers),
    );
  }

  Future<Response> post(HttpRequestDTO request) async {
    return await dio.postUri(
      request.uri,
      data: request.body,
      options: Options(headers: request.headers),
    );
  }
}
