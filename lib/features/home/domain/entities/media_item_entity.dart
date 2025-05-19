class MediaItemEntity {
  final int id;
  final String title;
  final String supplier;
  final DateTime outdated;
  final String url;

  MediaItemEntity({
    required this.id,
    required this.title,
    required this.supplier,
    required this.outdated,
    required this.url,
  });
}
