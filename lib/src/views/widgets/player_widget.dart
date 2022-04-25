import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'basic_overlay_widget.dart';

class PlayerWidget extends StatelessWidget {
  final int videoNum;
  final VideoPlayerController vp_controller;
  final ScrollController sc_controller;

  const PlayerWidget({
    Key? key,
    required this.videoNum,
    required this.vp_controller,
    required this.sc_controller,
  }) : super(key: key);

  Widget buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: vp_controller.value.aspectRatio,
      child: VideoPlayer(vp_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return vp_controller != null && vp_controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                buildVideoPlayer(),
                Positioned.fill(
                  child: BasicOverlayWidget(
                    videoNum: videoNum,
                    vp_controller: vp_controller,
                    sc_controller: sc_controller,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          );
  }
}
