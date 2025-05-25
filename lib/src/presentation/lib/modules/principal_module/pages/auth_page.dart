part of '../package.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(authLoginProvider)();
            },
            child: const Text('Login con Spotify'),
          ),
        ],
      )),
    );
  }
}
