import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wattchecker/constants/colors.dart';

class Videocard extends StatefulWidget {
  final String videoName;
  final String videoUrl;
  final String description;

  const Videocard({
    super.key,
    required this.videoName,
    required this.videoUrl,
    required this.description,
  });

  @override
  State<Videocard> createState() => _VideocardState();
}

class _VideocardState extends State<Videocard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: screenHeight * 0.25,
              width: screenWidth * 0.9,
              child: _isInitialized
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator(color: appBlack,)),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: screenWidth * 0.9,
              child: Text(
                widget.videoName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish'),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                widget.description,
                style: const TextStyle(
                    fontSize: 13, color: Colors.grey, fontFamily: 'Mulish'),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
