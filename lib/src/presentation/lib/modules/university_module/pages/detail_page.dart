part of '../package.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final university = ref.watch(selectedUniversityProvider);

    if (university == null) {
      return const BaseTemplate(
        titleAppar: 'Details Page',
        body: Center(child: Text('No se ha seleccionado ninguna universidad')),
      );
    }

    return BaseTemplate(
      titleAppar: 'Detalles',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoItem('Nombre', university.name),
            _infoItem('País', university.country),
            if (university.stateProvince != null)
              _infoItem('Estado', university.stateProvince!),
            _infoItem('Código ISO', university.alphaTwoCode),
            _infoList('Dominios', university.domains),
            _infoList('Páginas web', university.webPages, isLink: true),
            const SizedBox(height: 16),
            const ImagePickerWidget(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _infoList(String label, List<String> values, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          ...values.map((item) => _buildListItem(item, isLink)).toList(),
        ],
      ),
    );
  }

  Widget _buildListItem(String item, bool isLink) {
    if (isLink) {
      return InkWell(
        onTap: () => LauncherUtils.launchLink(item),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Text('• $item');
  }
}
