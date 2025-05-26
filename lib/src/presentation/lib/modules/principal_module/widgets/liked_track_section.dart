part of '../package.dart';

class LikedTracksSection extends ConsumerWidget {
  const LikedTracksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedAsync = ref.watch(likedTracksProvider);

    return likedAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error cargando favoritos: $e')),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No tienes canciones favoritas.'));
        }

        return _buildContent(items);
      },
    );
  }

  Column _buildContent(List<LikedTrack> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        _buildList(items),
      ],
    );
  }

  Padding _buildTitle() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Tus canciones favoritas',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  ListView _buildList(List<LikedTrack> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) {
        final item = items[index];
        return _buildTrackItem(item);
      },
    );
  }

  ListTile _buildTrackItem(LikedTrack item) {
    return ListTile(
      leading: item.imageUrl.isNotEmpty
          ? Image.network(item.imageUrl, width: 60)
          : const Icon(Icons.music_note),
      title: Text(item.name),
      subtitle: Text(item.artist),
    );
  }
}
