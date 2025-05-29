// import 'package:flutter/material.dart';
//
// class PIPOverlay extends StatefulWidget {
//   const PIPOverlay({super.key});
//
//   @override
//   State<PIPOverlay> createState() => _PIPOverlayState();
// }
//
// class _PIPOverlayState extends State<PIPOverlay> {
//   Offset _position = const Offset(20, 100); // 초기 위치
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: _position.dx,
//       top: _position.dy,
//       child: GestureDetector(
//         onPanUpdate: (details) {
//           setState(() {
//             _position += details.delta;
//           });
//         },
//         child: Container(
//           width: 160,
//           height: 90,
//           decoration: BoxDecoration(
//             color: Colors.black87,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.white),
//           ),
//           child: const Center(
//             child: Text(
//               '📺 PIP View',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PIPOverlay extends StatefulWidget {
  const PIPOverlay({super.key});

  @override
  State<PIPOverlay> createState() => _PIPOverlayState();
}

class _PIPOverlayState extends State<PIPOverlay> {
  late YoutubePlayerController _controller;
  Offset _position = const Offset(20, 100);

  @override
  void initState() {
    super.initState();
    final videoUrl = 'https://www.youtube.com/embed/vz6kIu7k7lI'; // 예시
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _position += details.delta;
          });
        },
        child: SizedBox(
          width: 210,
          height: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
        ),
      ),
    );
  }
}
