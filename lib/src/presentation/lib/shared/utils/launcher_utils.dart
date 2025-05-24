import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    await LauncherInstance.customLauncher(uri);
  }
}

class LauncherInstance {
  static Future<void> customLauncher(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
