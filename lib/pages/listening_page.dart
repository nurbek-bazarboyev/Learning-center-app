import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import '../components/task_item_page_components/task_item_app_bar.dart';

class ListeningPage extends StatefulWidget {
  const ListeningPage({super.key});

  @override
  State<ListeningPage> createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int? _savedPosition, newPositioN;

  @override
  void initState() {
    setupAudio();
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
     setState(() {});
      audioPlayer.durationStream.listen((newDuration) {
        setState(() {
          duration = newDuration!;
        });
      });
      audioPlayer.positionStream.listen((p) {
        setState(() {
          position = p;
        });
      });
    });
  }
  Future<void> setupAudio() async {
    await audioPlayer.setAsset("assets/music/01000000-0aff-0242-2f6f-08dc79de7d31_hq.mp3");
    //await audioPlayer.play();
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: buildTaskItemAppBar(context, "Listening"),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[400], //.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),

              ),child: CachedNetworkImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/TATU_logotip.png/800px-TATU_logotip.png',fit: BoxFit.fill,),
            ),
          ),
          Text(
            "Listening",
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "write this podcast word by word",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          Expanded(child: SizedBox()),
          SliderTheme(
              data: SliderThemeData(
                minThumbSeparation: 3,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
                trackHeight: 2,
                // set the track height to 10
                activeTickMarkColor: Colors.grey[600],
                inactiveTickMarkColor: Colors.grey[500],
              ),
              child: Slider(
                  activeColor: Colors.grey[600],
                  inactiveColor: Colors.grey[500],
                  //divisions: 30,
                  label: "Nurbek",
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    Duration newPosition = Duration(seconds: value.toInt());
                    await audioPlayer.seek(newPosition);
                    _savedPosition = value.toInt();
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${(position.inMinutes).toInt()<10 ? 0 : ""}${(position.inMinutes).toInt()}:${position.inSeconds%60<10?0:""}${position.inSeconds%60}",
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  "${(duration.inMinutes).toInt()<10?0:""}${(duration.inMinutes).toInt()}:${duration.inSeconds%60<10?0:""}${duration.inSeconds%60}",
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1s orqaga
                GestureDetector(
                    onTap: () {

                      setState(() {
                        if(position.inSeconds!=0){  audioPlayer
                            .seek(Duration(seconds: position.inSeconds - 1));}
                        _savedPosition = position.inSeconds - 1;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.backward_end_alt_fill,
                      color: Colors.grey[400],
                    )),
                SizedBox(
                  width: 15,
                ),
                // play and pause
                IconButton(
                    onPressed: () async {
                      if (audioPlayer.playing) {
                        _savedPosition = audioPlayer.position.inSeconds;
                        await audioPlayer.pause();
                        print("??////////////////////////////////////////////////////////////////////////////////////////////////////////////");
                      } else {
                        audioPlayer.seek(Duration(seconds: _savedPosition ?? 0));
                          //setAsset('assets/music/minna_shokyu_2_073.mp3')
                          // audioPlayer.playerStateStream.listen(( event) {event});
                         await audioPlayer.play();

                      }
                    },
                    iconSize: 60,
                    icon: audioPlayer.playing
                        ? Icon(
                            Icons.pause_circle,
                            color: Colors.grey[400],
                          )
                        : Icon(
                            Icons.play_circle,
                            color: Colors.grey[400],
                          )),
                SizedBox(
                  width: 15,
                ),
                // 1s oldinga
                GestureDetector(
                  onTap: (){

                    setState(() {
                      if(duration.inSeconds!=0&&duration.inSeconds!=position.inSeconds){audioPlayer.seek(Duration(seconds: position.inSeconds+1));}
                      _savedPosition = position.inSeconds+1;
                    });
                  },
                  child: Icon(
                    CupertinoIcons.forward_end_alt_fill,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
