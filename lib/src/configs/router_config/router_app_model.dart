part of 'package.dart';

class RouterNameModel {
  final String? name;
  final String path;
  final String access;

  const RouterNameModel({
    required this.path,
    required this.access,
    this.name,
  });
}
