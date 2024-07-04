import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hard_work_app/components/body_list_item/task_item/task_item.dart';
import 'package:hard_work_app/services/youtubeplayer.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:just_audio/just_audio.dart';

class YoutubeVideo extends StatefulWidget {
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'xZIh2so3-AU',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, change, child){
      return OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                    ),
                    builder: (context, player) {
                      return player;
                    },
                  ),
                ),
              );
            }else return ClipRRect(
              clipBehavior: Clip.hardEdge,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: _controller,
                        ),
                        builder: (context, player) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: player,
                            ),
                          );
                        },
                      ),
                    ),
                    TaskItem(),
                  ],
                ),
              ),
            );
          }) ;


    });

  }
}