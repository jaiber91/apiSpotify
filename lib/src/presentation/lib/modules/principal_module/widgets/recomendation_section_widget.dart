part of '../package.dart';

class RecommendationsSection extends ConsumerWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationsAsync = ref.watch(derivedRecommendationsProvider);

    return recommendationsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => const Center(
        child: Text(
          'Las recomendaciones no están disponibles.',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No hay recomendaciones por ahora.'));
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            final item = items[index];
            return ListTile(
              leading: item.imageUrl.isNotEmpty
                  ? Image.network(item.imageUrl, width: 60)
                  : const Icon(Icons.music_note),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
            );
          },
        );
      },
    );
  }
}
