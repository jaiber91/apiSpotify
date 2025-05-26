class LikedTrack {
  final String id;
  final String name;
  final String artist;
  final String imageUrl;
  final String? previewUrl;

  LikedTrack({
    required this.id,
    required this.name,
    required this.artist,
    required this.imageUrl,
    this.previewUrl,
  });
}
