part of '../package.dart';

class HomePage extends ConsumerWidget {
  final String code;

  const HomePage({super.key, required this.code});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(completeLoginProvider(code));

    return Scaffold(
      appBar: AppBar(title: const Text("Resultado")),
      body: Center(
        child: userAsync.when(
          data: (user) => Text("Usuario autenticado: ${user.email}"),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("❌ Error autenticando: $e"),
        ),
      ),
    );
  }
}
