import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    return Stack(
      children: [
        if (controller != null && controller.value.isInitialized)
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isMuted ? Icons.volume_mute : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.setVolume(isMuted ? 1 : 0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
