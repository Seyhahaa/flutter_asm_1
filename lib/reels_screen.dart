import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelScreen extends StatefulWidget {
  @override
  _ReelScreenState createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  final List<String> videoUrls = [
  "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4",
  "https://videos.pexels.com/video-files/3201291/3201291-hd_1080_1920_25fps.mp4",
  "https://videos.pexels.com/video-files/5824033/5824033-uhd_1440_2560_24fps.mp4",
  "https://videos.pexels.com/video-files/5824033/5824033-uhd_1440_2560_24fps.mp4",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
      ),
      body: ListView.builder(
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return VideoItem(
            videoUrl: videoUrls[index],
          );
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final String videoUrl;

  VideoItem({
    required this.videoUrl,
  });

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
         _videoController.play();
         _videoController.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          )
        : SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}