part of '../package.dart';

class SearchSection extends ConsumerWidget {
  final String query;
  final ValueChanged<String> onQueryChanged;

  const SearchSection({
    super.key,
    required this.query,
    required this.onQueryChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults =
        query.isNotEmpty ? ref.watch(searchProvider(query)) : null;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Busca artistas, álbumes o canciones',
              border: OutlineInputBorder(),
            ),
            onChanged: onQueryChanged,
          ),
        ),
        Expanded(
          child: Builder(
            builder: (_) {
              if (query.isEmpty) {
                return const Center(child: Text('🔍 Ingresa una búsqueda'));
              }

              if (searchResults == null) return const SizedBox();

              return searchResults.when(
                loading: () => const Center(child: CircularProgressIndicator()),
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
                        trailing: IconButton(
                          icon: Icon(
                            ref.watch(favoriteSeedsProvider).contains(item.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            print(
                                '⭐ Favorito seleccionado: ${item.title} (id: ${item.id}, type: ${item.type})');
                            await ref
                                .read(saveTrackFavoriteProvider)([item.id]);
                            ref
                                .read(favoriteSeedsProvider.notifier)
                                .toggle(item.id);
                          },
                        ),
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
  }
}
