import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_controller.dart';

class BasicOverlayWidget extends StatelessWidget {
  final int videoNum;
  final VideoPlayerController vp_controller;
  final ScrollController sc_controller;
  const BasicOverlayWidget({
    Key? key,
    required this.videoNum,
    required this.vp_controller,
    required this.sc_controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMuted = vp_controller.value.volume == 0;
    var textOnVideoStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    var buttonTextStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Stack(
      children: [
        if (vp_controller != null && vp_controller.value.isInitialized)
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
                    vp_controller.setVolume(isMuted ? 1 : 0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    vp_controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    vp_controller.value.isPlaying
                        ? vp_controller.pause()
                        : vp_controller.play();
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
                  style: textOnVideoStyle,
                ),
              if (videoNum == 1)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: textOnVideoStyle,
                ),
              if (videoNum == 2)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: textOnVideoStyle,
                ),
              if (videoNum == 3)
                Text(
                  videoList[videoNum].textOnVideo!.toString(),
                  style: textOnVideoStyle,
                ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  sc_controller.animateTo(
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
                    style: buttonTextStyle,
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
