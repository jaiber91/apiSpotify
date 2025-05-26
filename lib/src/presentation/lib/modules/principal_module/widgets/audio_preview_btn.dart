part of '../package.dart';

class _AudioPreviewButton extends StatefulWidget {
  final String previewUrl;

  const _AudioPreviewButton({required this.previewUrl});

  @override
  State<_AudioPreviewButton> createState() => _AudioPreviewButtonState();
}

class _AudioPreviewButtonState extends State<_AudioPreviewButton> {
  late final AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.playerStateStream.listen((state) {
      final isPlaying = state.playing;
      if (mounted && isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = isPlaying;
        });
      }
    });
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _player.stop();
    } else {
      await _player.setUrl(widget.previewUrl);
      await _player.play();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
      onPressed: _togglePlay,
    );
  }
}
