part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  final String code;

  const HomePage({super.key, required this.code});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String _query = '';
  int _selectedIndex = 0;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(completeLoginProvider(widget.code));

    final views = [
      SearchSection(
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
      const LikedTracksSection(),
    ];

    return userAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Error autenticando: $e')),
      ),
      data: (_) => BaseTemplate(
        titleAppar: _selectedIndex == 0 ? 'Buscar' : 'Favoritos',
        showLeadingBtnAppar: false,
        centerTitleAppar: true,
        body: Column(
          children: [
            Expanded(child: views[_selectedIndex]),
            BottomNavBarWidget(
              selectedIndex: _selectedIndex,
              onItemTapped: (index) => setState(() => _selectedIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}
