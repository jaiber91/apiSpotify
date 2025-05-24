part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _authService = SpotifyAuthService();
  final String codeApp =
      'AQA7ZgkUWHnMwVhCPCy4kTEKw3PXUb2cDgXmOxz6zjE5vyTMweyp0v8FZIplSVmIdNPFp9Dl43NTSe0ecIER-gyL08r7zj1DFErOssd3Tyhc_oOLHK2UpwBP3pq3md-wr8K-Rx1317FBYOd735DyqZt1JRx-Zg_RAU18C396HJjhqMuUL-IlqmvKusSYB7VEP3q2xNAgDtA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _authService.launchSpotifyLogin(),
            child: Text('Login con Spotify'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('${RouteNames.detailPage.path}?code=$codeApp');
            },
            child: Text('Ir a detailPage'),
          ),
        ],
      )),
    );
  }
}
