import 'dart:convert';

import 'package:adapters/auth_adapter/datasource/dto/auth_user_dto.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/http/http_api.dart';
import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';

class AuthUserDatasource {
  final HttpService _httpService;

  AuthUserDatasource({
    required HttpService httpService,
  }) : _httpService = httpService;

  Future<void> launchLogin() async {
    final uri = Uri.https(HttpPath.accountsExternal, HttpPath.authorize, {
      'client_id': HttpApi.clientId,
      'response_type': 'code',
      'redirect_uri': HttpApi.redirectUri,
      'scope': HttpApi.scopes,
    });

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir la URL de Spotify Login');
    }
  }

  Future<String> getToken(String code) async {
    final credentials = base64Encode(
        utf8.encode('${HttpApi.clientId}:${HttpApi.clientSecret}'));

    final response = await _httpService.post(
      path: HttpPath.apiToken,
      host: HttpPath.accountsExternal,
      headers: {
        'Authorization': 'Basic $credentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': HttpApi.redirectUri,
      },
    );

    return response.data['access_token'];
  }

  Future<AuthUserDto> getUser(String accessToken) async {
    final response = await _httpService.get(
      path: HttpPath.path,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    return AuthUserDto.fromJson(response.data);
  }
}
