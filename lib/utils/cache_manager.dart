import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheManager extends CacheManager {
  static const key = "debate_cache_manager";

  static final ImageCacheManager _instance = ImageCacheManager._();

  factory ImageCacheManager() {
    return _instance;
  }

  ImageCacheManager._()
      : super(
          Config(
            key,
            stalePeriod: const Duration(days: 90),
            maxNrOfCacheObjects: 500,
          ),
        );
}
