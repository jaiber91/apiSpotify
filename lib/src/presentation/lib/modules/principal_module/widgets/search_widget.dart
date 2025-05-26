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
        _buildSearchInput(context),
        Expanded(child: _buildSearchResults(context, ref, searchResults)),
      ],
    );
  }

  Widget _buildSearchInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Busca artistas, álbumes o canciones',
          prefixIcon: const Icon(Icons.search, color: Colors.orange),
          filled: true,
          fillColor: Colors.orange.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.orange.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orange, width: 2),
          ),
        ),
        onChanged: onQueryChanged,
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, WidgetRef ref,
      AsyncValue<List<SearchItems>>? results) {
    if (query.isEmpty) {
      return const Center(child: Text('Ingresa una búsqueda'));
    }

    if (results == null) return const SizedBox();

    return results.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No se encontraron resultados'));
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildSearchItem(context, ref, item);
          },
        );
      },
    );
  }

  Widget _buildSearchItem(
      BuildContext context, WidgetRef ref, SearchItems item) {
    final isFavorite = ref.watch(favoriteSeedsProvider).contains(item.id);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: item.imageUrl.isNotEmpty
              ? Image.network(item.imageUrl,
                  width: 60, height: 60, fit: BoxFit.cover)
              : const Icon(Icons.music_note, size: 40),
        ),
        title: Text(item.title),
        subtitle: Text(item.subtitle),
        trailing: _buildFavoriteButton(ref, item.id, isFavorite),
      ),
    );
  }

  Widget _buildFavoriteButton(WidgetRef ref, String id, bool isFavorite) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.orange,
      ),
      onPressed: () async {
        await ref.read(saveTrackFavoriteProvider)([id]);
        ref.invalidate(likedTracksProvider);
        ref.read(favoriteSeedsProvider.notifier).toggle(id);
      },
    );
  }
}
