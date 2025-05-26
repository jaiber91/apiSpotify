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
  Column build(BuildContext context, WidgetRef ref) {
    final searchResults =
        query.isNotEmpty ? ref.watch(searchProvider(query)) : null;

    return Column(
      children: [
        _buildSearchInput(),
        Expanded(child: _buildSearchResults(ref, searchResults)),
      ],
    );
  }

  Padding _buildSearchInput() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Busca artistas, álbumes o canciones',
          border: OutlineInputBorder(),
        ),
        onChanged: onQueryChanged,
      ),
    );
  }

  Widget _buildSearchResults(
      WidgetRef ref, AsyncValue<List<SearchItems>>? results) {
    if (query.isEmpty) {
      return const Center(child: Text('🔍 Ingresa una búsqueda'));
    }

    if (results == null) return const SizedBox();

    return results.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(' Error: $e')),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No se encontraron resultados'));
        }

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildSearchItem(context, ref, item);
          },
        );
      },
    );
  }

  ListTile _buildSearchItem(
      BuildContext context, WidgetRef ref, SearchItems item) {
    final isFavorite = ref.watch(favoriteSeedsProvider).contains(item.id);

    return ListTile(
      leading: item.imageUrl.isNotEmpty
          ? Image.network(item.imageUrl,
              width: 60, height: 60, fit: BoxFit.cover)
          : const Icon(Icons.music_note),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      trailing: _buildFavoriteButton(ref, item.id, isFavorite),
    );
  }

  IconButton _buildFavoriteButton(WidgetRef ref, String id, bool isFavorite) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () async {
        await ref.read(saveTrackFavoriteProvider)([id]);
        ref.invalidate(likedTracksProvider);
        ref.read(favoriteSeedsProvider.notifier).toggle(id);
      },
    );
  }
}
