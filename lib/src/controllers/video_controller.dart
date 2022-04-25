class VideoModel {
  final int? videoNumber;
  final String? videoUrl;

  VideoModel({
    this.videoNumber,
    this.videoUrl,
  });
}

List<VideoModel> videoList = [
  VideoModel(
      videoNumber: 0,
      videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/02.mp4'),
  VideoModel(
      videoNumber: 1,
      videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/03.mp4'),
  VideoModel(
      videoNumber: 2,
      videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/4.mp4'),
  VideoModel(
      videoNumber: 3,
      videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/5.mp4'),
];
