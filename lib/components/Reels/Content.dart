// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/CommentModal.dart';
import 'package:ulkersocialv2/components/ToastMessage.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class ReelsContent extends StatefulWidget {
  final reel;
  final token;
  final myId;
  final Function loadReels;

  const ReelsContent(
      {
        Key? key,
        required this.reel,
        required this.token,
        required this.myId,
        required this.loadReels,
      })
      : super(key: key);

  @override
  _ReelsContentState createState() => _ReelsContentState();
}

class _ReelsContentState extends State<ReelsContent> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  ValueNotifier<int> likesCountNotifier = ValueNotifier<int>(0);
  bool isLiked = false;
  bool isPlaying = false;
  bool isMute = false;
  var duration;

  @override
  void initState() {
    super.initState();
    initializePlayer();

    setState(() {
      isLiked = widget.reel['likes'].contains(widget.myId);
      likesCountNotifier.value = widget.reel['likes'].length;
    });

    _videoPlayerController.addListener(() {
      setState(() {
        isPlaying = _videoPlayerController.value.isPlaying;
        isMute = _videoPlayerController.value.volume == 0.0;
        duration = Duration(
            milliseconds:
                _videoPlayerController.value.position.inMilliseconds.round());
      });
    });
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.reel['video'] ?? ""));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void likeUnlikeAction() async {
    if (mounted) {
      setState(() {
        if (isLiked) {
          widget.reel['likes'].remove(widget.myId);
          likesCountNotifier.value -= 1;
        } else {
          widget.reel['likes'].add(widget.myId);
          likesCountNotifier.value += 1;
        }

        isLiked = !isLiked;
      });
    }

    await http.put(
      Uri.parse(
          "https://ulker-social-backend.tarikadmin35.repl.co/reel/${!isLiked ? "unlike" : "like"}"),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'authorization': '${widget.token}'
      },
      body: json.encode({'postId': widget.reel['_id']}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // ! Video Player
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized &&
                widget.reel['video'] != null
            ? GestureDetector(
                onLongPress: () {
                  _videoPlayerController.pause();
                },
                onLongPressEnd: (_) {
                  _videoPlayerController.play();
                },
                onTap: () {
                  /*if (isPlaying) {
                    _videoPlayerController.pause();
                  } else {
                    _videoPlayerController.play();

                  }*/

                  _videoPlayerController.setVolume(isMute ? 1.0 : 0.0);
                },
                onDoubleTap: () {
                  likeUnlikeAction();
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),

        // ! Paused Icon
        !isPlaying
            ? Icon(
                Icons.play_arrow,
                size: 100,
                color: Colors.white70,
              )
            : const SizedBox(),

        // ! Muted Icon
        isMute && isPlaying
            ? Icon(
                Icons.volume_off_rounded,
                size: 100,
                color: Colors.white70,
              )
            : const SizedBox(),

        // ! Actions
        Positioned(
            bottom: 75,
            right: 15,
            child: Column(
              children: [
                // ! Like & Unlike
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        likeUnlikeAction();
                      },
                      child: Icon(
                        isLiked
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline,
                        color: isLiked ? Colors.red : Colors.white,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: likesCountNotifier,
                      builder: (context, likesCount, child) {
                        return GestureDetector(
                          child: Text("${likesCountNotifier.value} Beğenme",
                              style: TextStyle(color: Colors.white)),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // ! Comment
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: Colors.black12.withOpacity(0.6),
                          barrierLabel: 'Dialog',
                          builder: (_) {
                            return CommentModal(
                              user: widget.reel['postedBy'],
                              loadPosts: widget.loadReels,
                              token: widget.token,
                              post: widget.reel,
                              reelsMode: true,
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.comment_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.reel['comments'].length} Yorum",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // ! Delete
                widget.reel['postedBy']['_id'] == widget.myId
                    ? GestureDetector(
                        onTap: () async {
                          final response = await http.delete(
                              Uri.parse("https://ulker-social-backend.tarikadmin35.repl.co/deletereel/${widget.reel['_id']}"),
                              headers: {
                                'Content-Type': 'application/json',
                                'authorization': '${widget.token}'
                              });

                          print(response.body);
                          if (response.statusCode == 200) {
                            ToastMessage(context, "Reel silindi","Reelini başarıyla arabistana yolladın.", action: false);
                            widget.loadReels();

                          }
                        },
                        child: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                          size: 35,
                        ),
                      )
                    : SizedBox()
              ],
            )),

        // ! PostedBy & Title
        Positioned(
            left: 5,
            bottom: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! Posted By
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: widget.reel['postedBy'].containsKey('pic')
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${widget.reel['postedBy']['pic']}"),
                                  fit: BoxFit.cover),
                            )
                          : null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.reel['postedBy']['name']}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                // ! Title
                Text(
                  "${widget.reel['title']}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),

        // ! Player Timeline
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height - 120,
          ),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                thumbColor: Colors.transparent,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.1)),
            child: Slider(
              thumbColor: Colors.transparent,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              value: duration != null ? duration.inMilliseconds.toDouble() : 0,
              min: 0,
              max: _videoPlayerController.value.duration.inMilliseconds
                  .toDouble(),
              onChanged: (newDuration) {
                final newPosition = Duration(milliseconds: newDuration.toInt());
                _videoPlayerController.seekTo(newPosition);
              },
            ),
          ),
        ),
      ],
    );
  }
}
