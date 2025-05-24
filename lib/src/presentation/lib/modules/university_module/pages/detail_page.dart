part of '../package.dart';

class SpotifyCallbackPage extends StatefulWidget {
  final String code;

  const SpotifyCallbackPage({super.key, required this.code});

  @override
  _SpotifyCallbackPageState createState() => _SpotifyCallbackPageState();
}

class _SpotifyCallbackPageState extends State<SpotifyCallbackPage> {
  final _authService = SpotifyAuthService();
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    print('✅ Entró a SpotifyCallbackPage con code: ${widget.code}');

    authenticateUser();
  }

  Future<void> authenticateUser() async {
    try {
      final token = await _authService.exchangeCodeForToken(widget.code);
      final profile = await _authService.getUserProfile(token);
      setState(() {
        _userEmail = profile['email'];
      });
    } catch (e) {
      print("Error autenticando: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultado")),
      body: Center(
        child: _userEmail == null
            ? const CircularProgressIndicator()
            : Text("Usuario autenticado: $_userEmail"),
      ),
    );
  }
}
