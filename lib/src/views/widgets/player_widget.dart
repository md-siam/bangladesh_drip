import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_controller.dart';

class PlayerWidget extends StatelessWidget {
  final int videoNum;
  final VideoPlayerController videoController;
  final ScrollController scrollController;

  const PlayerWidget({
    Key? key,
    required this.videoNum,
    required this.videoController,
    required this.scrollController,
  }) : super(key: key);

  Widget buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio,
      child: VideoPlayer(videoController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return videoController != null && videoController.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                buildVideoPlayer(),

                /// `information` on top of each of the video
                ///
                Positioned.fill(
                  child: VideoOverlay(
                    videoNum: videoNum,
                    videoController: videoController,
                    scrollController: scrollController,
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

class VideoOverlay extends StatelessWidget {
  final int videoNum;
  final VideoPlayerController videoController;
  final ScrollController scrollController;
  const VideoOverlay({
    Key? key,
    required this.videoNum,
    required this.videoController,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMuted = videoController.value.volume == 0;
    var _onVideoTextStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    var _buttonTextStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Stack(
      children: [
        if (videoController != null && videoController.value.isInitialized)
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
                    videoController.setVolume(isMuted ? 1 : 0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    videoController.value.isPlaying
                        ? videoController.pause()
                        : videoController.play();
                  },
                ),
              ],
            ),
          ),
        Positioned(
          left: 10.0,
          bottom: 15.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (videoNum == 0)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: _onVideoTextStyle,
                ),
              if (videoNum == 1)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: _onVideoTextStyle,
                ),
              if (videoNum == 2)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: _onVideoTextStyle,
                ),
              if (videoNum == 3)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: _onVideoTextStyle,
                ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  color: Colors.white,
                  child: Text(
                    'Discover the Collection',
                    style: _buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
