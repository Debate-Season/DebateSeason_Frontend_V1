import 'package:cached_network_image/cached_network_image.dart';
import 'package:debateseason_frontend_v1/core/constants/color.dart';
import 'package:debateseason_frontend_v1/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DeCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const DeCachedImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final fullImageUrl = '${dotenv.get('IMAGE_BASE_URL')}imageUrl';

    return CachedNetworkImage(
      imageUrl: fullImageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheManager: ImageCacheManager(),
      imageBuilder: (context, imageProvider) => Image(
        image: CachedNetworkImageProvider(
          fullImageUrl,
          cacheManager: ImageCacheManager(),
        ),
        fit: fit,
        width: width,
        height: height,
      ),
      errorWidget: (context, url, error) => _errorWidget(),
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      fadeInDuration: Duration.zero,
      placeholderFadeInDuration: Duration.zero,
      useOldImageOnUrlChange: true,
    );
  }

  Widget _errorWidget() {
    return Container(
      width: width,
      height: height,
      color: grey50,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error),
        ],
      ),
    );
  }
}
