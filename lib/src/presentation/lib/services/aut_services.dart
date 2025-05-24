import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

const clientId = '8c492dc0ba5b47bf86de904065ceca4c';
const clientSecret = '6e8ecc85365c4f039ce7e145fcbae5a6';
const redirectUri = 'myapp://callback';
const scopes = 'user-read-email user-read-private';

class SpotifyAuthService {
  final Dio _dio = Dio();

  String getAuthUrl() {
    final uri = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': clientId,
      'response_type': 'code',
      'redirect_uri': redirectUri,
      'scope': scopes,
    });
    return uri.toString();
  }

  Future<void> launchSpotifyLogin() async {
    final url = Uri.parse(getAuthUrl());
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo lanzar URL de Spotify');
    }
  }

  Future<String> exchangeCodeForToken(String code) async {
    final credentials = base64Encode(utf8.encode('$clientId:$clientSecret'));
    print('credentials_app $credentials');
    final response = await _dio.post(
      'https://accounts.spotify.com/api/token',
      options: Options(
        headers: {
          'Authorization': 'Basic $credentials',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
      },
    );

    return response.data['access_token'];
  }

  Future<Map<String, dynamic>> getUserProfile(String accessToken) async {
    final response = await _dio.get(
      'https://api.spotify.com/v1/me',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    return response.data;
  }
}
