import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({Key? key}) : super(key: key);

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  initializePlayer() async {
    videoPlayerController = await VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((value) => setState(() {}));

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: chewieController),
                  )
                : Image(
                    height: double.infinity,
                    width: double.infinity,
                    image: NetworkImage(
                        'https://murai.my/wp-content/uploads/2019/03/D2jvOdmUgAALnnx.jpg-large.jpeg',
                        scale: 0.1),
                  ),
          ],
        ),
      ),
    );
  }
}
