part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    final universityAsyncValue = ref.watch(getUniversityProvider);

    return BaseTemplate(
      titleAppar: 'Listado de universidades',
      showLeadingBtnAppar: false,
      actions: [
        IconButton(
          icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
          onPressed: () {
            setState(() {
              _isGrid = !_isGrid;
            });
          },
        ),
      ],
      centerTitleAppar: true,
      body: universityAsyncValue.when(
        data: (universities) {
          if (universities.isEmpty) return _isEmptyList();
          return _buildCardView(universities);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Center _isEmptyList() {
    return const Center(
      child: Text(
        'No se encontraron universidades.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCardView(List<UniversityDomain> universities) {
    return _isGrid
        ? _gridViewCards(universities)
        : _listViewCards(universities);
  }

  Widget _gridViewCards(List<UniversityDomain> universities) {
    return GridView.builder(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2,
      ),
      itemCount: universities.length,
      itemBuilder: (context, index) {
        final university = universities[index];
        return CustomGridCard(
          name: university.name,
          country: university.country,
          onTap: () {
            ref.read(selectedUniversityProvider.notifier).state = university;
            context.go(RouteNames.detailPage.path);
          },
        );
      },
    );
  }

  ListView _listViewCards(List<UniversityDomain> universities) {
    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: universities.length,
      itemBuilder: (context, index) {
        final university = universities[index];
        return CustomCard(
          name: university.name,
          country: university.country,
          onTap: () {
            ref.read(selectedUniversityProvider.notifier).state = university;
            context.go(RouteNames.detailPage.path);
          },
        );
      },
    );
  }
}
