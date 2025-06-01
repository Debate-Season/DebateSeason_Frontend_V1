class YoutubeLiveEntity {
  final int id;
  final String title;
  final String supplier;
  final String videoId;
  final String category;
  final DateTime? createAt;
  final String? src;

  YoutubeLiveEntity({
    required this.id,
    required this.title,
    required this.supplier,
    required this.videoId,
    required this.category,
    this.createAt,
    this.src,
  });
}