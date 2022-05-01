import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_controller.dart';
import 'widgets/app_bar.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const AppBarWidget(),
              VideoPlayerWidget(
                videoNumber: videoList[0].videoNumber!.toInt(),
                videoController: VideoPlayerController.network(
                  videoList[0].videoUrl.toString(),
                  videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
                ),
                scrollController: scrollController,
              ),
              VideoPlayerWidget(
                videoNumber: videoList[1].videoNumber!.toInt(),
                videoController: VideoPlayerController.network(
                  videoList[1].videoUrl.toString(),
                  videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
                ),
                scrollController: scrollController,
              ),
              VideoPlayerWidget(
                videoNumber: videoList[2].videoNumber!.toInt(),
                videoController: VideoPlayerController.network(
                  videoList[2].videoUrl.toString(),
                  videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
                ),
                scrollController: scrollController,
              ),
              VideoPlayerWidget(
                videoNumber: videoList[3].videoNumber!.toInt(),
                videoController: VideoPlayerController.network(
                  videoList[3].videoUrl.toString(),
                  videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
                ),
                scrollController: scrollController,
              ),
              const BottomBarWidget()
            ],
          ),
        ),
      ),
    );
  }
}
