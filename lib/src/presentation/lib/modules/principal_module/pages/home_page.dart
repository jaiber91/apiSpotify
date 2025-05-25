part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  final String code;

  const HomePage({super.key, required this.code});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String _query = '';
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(completeLoginProvider(widget.code));

    return Scaffold(
      appBar: AppBar(title: const Text("Buscar en Spotify")),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('❌ Error autenticando: $e')),
        data: (_) => SearchSection(
          query: _query,
          onQueryChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              setState(() {
                _query = value.trim();
              });
            });
          },
        ),
      ),
    );
  }
}
