import 'package:debateseason_frontend_v1/features/profile/presentation/widgets/web_view.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  const WebViewPage({
    super.key,
    required this.url,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    return WebWidget(
        initialUrl: url,
        title: title,
      );
  }
}
