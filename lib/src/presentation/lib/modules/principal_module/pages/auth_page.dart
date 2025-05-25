part of '../package.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(authSessionProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('❌ Error: $err')),
        data: (token) {
          if (token == null) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(authLoginProvider)();
                },
                child: const Text('Login con Spotify'),
              ),
            );
          } else {
            return const Center(
              child: Text('🎵 Sesión activa con Spotify'),
            );
          }
        },
      ),
    );
  }
}
