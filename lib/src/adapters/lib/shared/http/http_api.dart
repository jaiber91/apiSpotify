//TODO: CREATE .ENV OR REMOTECONFIG
abstract class HttpApi {
  static String clientId = '';
  static String redirectUri = 'myapp://callback';
  static String clientSecret = '';
  static String scopes =
      'user-read-email user-read-private user-library-modify user-library-read user-top-read';
}
