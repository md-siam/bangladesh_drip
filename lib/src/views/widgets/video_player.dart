import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_controller.dart';

class VideoPlayerWidget extends StatefulWidget {
  final int videoNumber;
  final VideoPlayerController videoController;
  final ScrollController scrollController;

  const VideoPlayerWidget({
    Key? key,
    required this.videoNumber,
    required this.videoController,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    super.initState();
    widget.videoController
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => widget.videoController.play());
  }

  @override
  void dispose() {
    widget.videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.videoController.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: widget.videoController.value.aspectRatio,
                  child: VideoPlayer(widget.videoController),
                ),

                /// `information` on top of each of the video
                ///
                Positioned.fill(
                  child: VideoOverlay(
                    videoNum: widget.videoNumber,
                    videoController: widget.videoController,
                    scrollController: widget.scrollController,
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

/// This [VideoOverlay] widget displays the control `mute` & `pause` button
/// over each of the videos
///
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
    
    var textStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    /// display `Video Title`
    ///
    Widget textOnVideo(int videoNum) {
      switch (videoNum) {
        case 0:
          return Text(
            videoList[0].textOnVideo!.toString(),
            style: textStyle,
          );
        case 1:
          return Text(
            videoList[1].textOnVideo!.toString(),
            style: textStyle,
          );
        case 2:
          return Text(
            videoList[2].textOnVideo!.toString(),
            style: textStyle,
          );
        case 3:
          return Text(
            videoList[3].textOnVideo!.toString(),
            style: textStyle,
          );

        default:
          return const Text('Title Not Given');
      }
    }

    return Stack(
      children: [
        if (videoController.value.isInitialized)
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
              textOnVideo(videoNum),
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
                    style: textStyle.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
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
