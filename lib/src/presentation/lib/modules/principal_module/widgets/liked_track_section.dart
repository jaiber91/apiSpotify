part of '../package.dart';

class LikedTracksSection extends ConsumerWidget {
  const LikedTracksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedAsync = ref.watch(likedTracksProvider);

    return likedAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text('Error cargando favoritos: $e',
            style: const TextStyle(color: Colors.red)),
      ),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No tienes canciones favoritas.'));
        }

        return SafeArea(
          child: SingleChildScrollView(
            child: _buildContent(context, items),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, List<LikedTrack> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildTrackList(items),
      ],
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Tus canciones favoritas',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFA500),
        ),
      ),
    );
  }

  Widget _buildTrackList(List<LikedTrack> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final item = items[index];
        return _buildTrackCard(item);
      },
    );
  }

  Widget _buildTrackCard(LikedTrack item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: item.imageUrl.isNotEmpty
              ? Image.network(item.imageUrl,
                  width: 60, height: 60, fit: BoxFit.cover)
              : const Icon(Icons.music_note, size: 40),
        ),
        title: Text(item.name),
        subtitle: Text(item.artist),
        trailing: item.previewUrl != null
            ? _AudioPreviewButton(previewUrl: item.previewUrl!)
            : const Icon(Icons.block, color: Colors.grey),
      ),
    );
  }
}
