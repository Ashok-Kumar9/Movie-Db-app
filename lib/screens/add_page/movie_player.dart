import 'package:MovieFlex/controllers/movie_detail_controller.dart';
import 'package:MovieFlex/models/genreModel.dart';
import 'package:MovieFlex/utils/reusable_widgets.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({Key? key}) : super(key: key);

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  late final VideoPlayerController videoPlayerController;
  final MovieDetailController movieController = Get.find();
  late final ChewieController chewieController;
  bool thumbnail = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  initializePlayer() {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    );

    setState(() {
      isLoading = false;
    });
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
      body: isLoading
          ? Center(child: RefreshProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                buildVideoPlayerStack(),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'More Like This',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 24.0),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: genreslist.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ReusableWidgets().genreCard(
                      Colors.lightBlue,
                      'Movie Name',
                      genreslist[index]['image'].toString(),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  buildVideoPlayerStack() {
    return thumbnail
        ? Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: NetworkImage(
                    'https://murai.my/wp-content/uploads/2019/03/D2jvOdmUgAALnnx.jpg-large.jpeg',
                    scale: 0.1),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  thumbnail = false;
                  videoPlayerController.play();
                }),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.6),
                  radius: 30.0,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.lightBlue,
                    size: 48.0,
                  ),
                ),
              ),
            ],
          )
        : AspectRatio(
            child: Chewie(controller: chewieController),
            aspectRatio: videoPlayerController.value.aspectRatio,
          );
  }
}
