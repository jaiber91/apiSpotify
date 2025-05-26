part of '../package.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  static const Color orange = Color(0xFFFFA500);
  static const Color orangeDark = Color(0xFFCC8400);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(authSessionProvider);

    sessionAsync.whenData((token) {
      if (token != null) {
        Future.microtask(() {
          final currentLocation = GoRouterState.of(context).uri.toString();
          if (currentLocation != RouteNames.homePage.path) {
            context.go(RouteNames.homePage.path);
          }
        });
      }
    });

    return BaseTemplate(
      titleAppar: '¡Hola!',
      showLeadingBtnAppar: false,
      centerTitleAppar: true,
      actions: const [],
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [orange, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: sessionAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: orangeDark),
          ),
          error: (err, _) => Center(
            child: Text(
              'Error: $err',
              style: const TextStyle(color: orangeDark),
            ),
          ),
          data: (token) {
            return token == null
                ? _buildLoginPrompt(ref)
                : _buildSessionActive();
          },
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.music_note, size: 80, color: orangeDark),
          const SizedBox(height: 20),
          const Text(
            'Inicia sesión con Spotify',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: orangeDark,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () => ref.read(authLoginProvider)(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: orangeDark,
              shadowColor: Colors.black26,
              elevation: 6,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(Icons.login),
            label: const Text('Conectar con Spotify'),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionActive() {
    return const Center(
      child: Text(
        'Sesión activa con Spotify',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: orangeDark,
        ),
      ),
    );
  }
}
