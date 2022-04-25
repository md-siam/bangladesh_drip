import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  final videoURL1 = 'https://bangladesh-drip.2aitautomation.com/img/02.mp4';
  final videoURL2 = 'https://bangladesh-drip.2aitautomation.com/img/03.mp4';
  final videoURL3 = 'https://bangladesh-drip.2aitautomation.com/img/4.mp4';
  final videoURL4 = 'https://bangladesh-drip.2aitautomation.com/img/5.mp4';

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.network(videoURL1)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller1.play())
      ..setVolume(0.0);
    _controller2 = VideoPlayerController.network(videoURL2)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller2.play())
      ..setVolume(0.0);
    _controller3 = VideoPlayerController.network(videoURL3)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller3.play())
      ..setVolume(0.0);
    _controller4 = VideoPlayerController.network(videoURL4)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller4.play())
      ..setVolume(0.0);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.white,
                child: Row(children: [Image.asset('name')],),
              ),
              // PlayerWidget(controller: _controller1),
              // PlayerWidget(controller: _controller2),
              // PlayerWidget(controller: _controller3),
              // PlayerWidget(controller: _controller4),
            ],
          ),
        ),
      ),
    );
  }
}
