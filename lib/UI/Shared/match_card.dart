import 'package:birddie/UI/Dashboard/Matching/search_match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class MatchCard extends StatefulWidget {
  final String? name;
  final String? job;
  final String? age;
  final String? location;
  final String? matchCriteria;
  final String? video;
  const MatchCard(
      {Key? key,
      this.name,
      this.job,
      this.location,
      this.matchCriteria,
      this.video,
      this.age})
      : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  var _state = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.video!,
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 125,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 84, 84, 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                    _state = !_state;
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              child: SizedBox(
                width: 195,
                height: 110,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Text(widget.name! + ' ' + widget.age!,
                    style: GoogleFonts.asap(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                const SizedBox(height: 5),
                Text('Job Title:\t${widget.job}',
                    style: GoogleFonts.asap(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                Text('Location\t${widget.location}',
                    style: GoogleFonts.asap(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                Row(
                  children: [
                    Text('Match\nCriteria',
                        style: GoogleFonts.asap(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(widget.matchCriteria!,
                        style: GoogleFonts.asap(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 76,
                      height: 18,
                      child: ElevatedButton(
                        onPressed: () {
                          //Get.to(const Search());
                        },
                        child: Text(
                          'Match',
                          style: GoogleFonts.asap(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 238, 84, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 238, 84, 1),
                              )),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
