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
        data: (user) {
          final searchResults =
              _query.isNotEmpty ? ref.watch(searchProvider(_query)) : null;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Busca artistas, álbumes o canciones',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      setState(() {
                        _query = value.trim();
                      });
                    });
                  },
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (_) {
                    if (_query.isEmpty) {
                      return const Center(
                          child: Text('🔍 Ingresa una búsqueda'));
                    }

                    if (searchResults == null) return const SizedBox();

                    return searchResults.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('❌ Error: $e')),
                      data: (items) {
                        if (items.isEmpty) {
                          return const Center(
                              child: Text('😕 No se encontraron resultados'));
                        }

                        return ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return ListTile(
                              leading: item.imageUrl.isNotEmpty
                                  ? Image.network(
                                      item.imageUrl,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.music_note),
                              title: Text(item.title),
                              subtitle: Text(item.subtitle),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
