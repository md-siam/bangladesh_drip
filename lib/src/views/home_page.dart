import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_controller.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bottombar.dart';
import 'widgets/player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller0;
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  final sc_controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller0 =
        VideoPlayerController.network(videoList[0].videoUrl.toString())
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => _controller0.play())
          ..setVolume(0.0);
    _controller1 =
        VideoPlayerController.network(videoList[1].videoUrl.toString())
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => _controller1.play())
          ..setVolume(0.0);
    _controller2 =
        VideoPlayerController.network(videoList[2].videoUrl.toString())
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => _controller2.play())
          ..setVolume(0.0);
    _controller3 =
        VideoPlayerController.network(videoList[3].videoUrl.toString())
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => _controller3.play())
          ..setVolume(0.0);
  }

  @override
  void dispose() {
    _controller0.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: sc_controller,
          child: Column(
            children: [
              const CustomAppBar(),
              PlayerWidget(
                videoNum: videoList[0].videoNumber!.toInt(),
                vp_controller: _controller0,
                sc_controller: sc_controller,
              ),
              PlayerWidget(
                videoNum: videoList[1].videoNumber!.toInt(),
                vp_controller: _controller1,
                sc_controller: sc_controller,
              ),
              PlayerWidget(
                videoNum: videoList[2].videoNumber!.toInt(),
                vp_controller: _controller2,
                sc_controller: sc_controller,
              ),
              PlayerWidget(
                videoNum: videoList[3].videoNumber!.toInt(),
                vp_controller: _controller3,
                sc_controller: sc_controller,
              ),
              const CustomBottomBar()
            ],
          ),
        ),
      ),
    );
  }
}
