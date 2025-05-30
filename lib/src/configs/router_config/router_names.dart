part of 'package.dart';

class RouteNames {
  static RouterNameModel _rute(String path, String access, [String? name]) =>
      RouterNameModel(path: path, access: access, name: name);

  static RouterNameModel get main => _rute('/', '/');

  static RouterNameModel get homePage => _rute(
        '/home_page',
        '/home_page',
      );
}
