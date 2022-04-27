class VideoModel {
  final int? videoNumber;
  final String? textOnVideo;
  final String? videoUrl;

  VideoModel({
    this.videoNumber,
    this.textOnVideo,
    this.videoUrl,
  });
}

List<VideoModel> videoList = [
  VideoModel(
    videoNumber: 0,
    textOnVideo: 'TAMBOUR STREET DIVER',
    videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/02.mp4',
  ),
  VideoModel(
    videoNumber: 1,
    textOnVideo: 'LV VOLT',
    videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/03.mp4',
  ),
  VideoModel(
    videoNumber: 2,
    textOnVideo: 'SPRING IN THE CITY',
    videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/4.mp4',
  ),
  VideoModel(
    videoNumber: 3,
    textOnVideo: 'SPELL ON YOU WITH LÉA\nSEYDOUX',
    videoUrl: 'https://bangladesh-drip.2aitautomation.com/img/5.mp4',
  ),
];
