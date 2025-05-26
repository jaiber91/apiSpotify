import 'package:adapters/shared/http/dto/http_request_dto.dart';
import 'package:adapters/shared/http/dto/http_response_dto.dart';
import 'package:adapters/shared/http/http_interface.dart';
import 'package:adapters/shared/http/http_path.dart';
import 'package:dio/dio.dart';

class HttpService {
  final HttpInterface _httInterface;

  HttpService(this._httInterface);

  HttpResponseDTO<T> _httpResponseDTO<T>(Response response) {
    return HttpResponseDTO<T>(
      data: response.data,
    );
  }

  HttpRequestDTO _buildRequest({
    required String path,
    String host = HttpPath.baseUrl,
    Map<String, dynamic>? queryParameters,
    final Map<String, dynamic> body = const {},
    final Map<String, dynamic> headers = const {},
  }) {
    return HttpRequestDTO(
      uri: Uri(
        scheme: HttpPath.schemes,
        host: host,
        path: path,
        queryParameters: queryParameters,
      ),
      headers: headers,
      body: body,
    );
  }

  Future<HttpResponseDTO<T>> get<T>({
    required String path,
    String host = HttpPath.baseUrl,
    Map<String, dynamic>? queryParameters,
    final Map<String, dynamic> body = const {},
    final Map<String, dynamic> headers = const {},
  }) async {
    final request = _buildRequest(
      path: path,
      host: host,
      queryParameters: queryParameters,
      body: body,
      headers: headers,
    );

    final response = await _httInterface.get(request);
    return _httpResponseDTO(response);
  }

  Future<HttpResponseDTO<T>> post<T>({
    required String path,
    String host = HttpPath.baseUrl,
    Map<String, dynamic>? queryParameters,
    final Map<String, dynamic> body = const {},
    final Map<String, dynamic> headers = const {},
  }) async {
    final request = _buildRequest(
      path: path,
      host: host,
      queryParameters: queryParameters,
      body: body,
      headers: headers,
    );

    final response = await _httInterface.post(request);
    return _httpResponseDTO(response);
  }

  Future<HttpResponseDTO<T>> put<T>({
    required String path,
    String host = HttpPath.baseUrl,
    Map<String, dynamic>? queryParameters,
    final Map<String, dynamic> body = const {},
    final Map<String, dynamic> headers = const {},
  }) async {
    final request = _buildRequest(
      path: path,
      host: host,
      queryParameters: queryParameters,
      body: body,
      headers: headers,
    );

    final response = await _httInterface.put(request);
    return _httpResponseDTO(response);
  }
}
