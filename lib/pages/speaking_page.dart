import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hard_work_app/components/task_item_page_components/speaking_part.dart';
import 'package:hard_work_app/components/task_item_page_components/task_item_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SpeakingTaskPage extends StatefulWidget {
  const SpeakingTaskPage({super.key});

  @override
  State<SpeakingTaskPage> createState() => _SpeakingTaskPageState();
}

class _SpeakingTaskPageState extends State<SpeakingTaskPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'Whetyw1aUyU',
    flags: YoutubePlayerFlags(
      //hideControls: true,
      autoPlay: false,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation){
        if (orientation != Orientation.landscape) {
          return Scaffold(
        appBar: buildTaskItemAppBar(context,"Speaking"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // part 1   and ideas   text
              SizedBox(height: 30,),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeakingPart(part: 1,)));},
                tileColor: Colors.grey.shade300,
                leading: Icon(Icons.my_library_books_sharp,color: Colors.blue.withOpacity(.6),),
                title: Text("Part 1",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10,),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeakingPart(part: 2,)));},
                tileColor: Colors.grey.shade300,
                leading: Icon(Icons.my_library_books_sharp,color: Colors.blue.withOpacity(.6),),
                title: Text("Part 2",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10,),
              ListTile(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeakingPart(part: 3,)));},
                tileColor: Colors.grey.shade300,
                leading: Icon(Icons.my_library_books_sharp,color: Colors.blue.withOpacity(.6),),
                title: Text("Part 3",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 30,),
              Text("For immitating",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
              ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
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
          )
            ],
          ),
        ),
      );
        } else {
          return Material(
            child: Container(
              height: size.height-60,
              width: size.width-40,
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
        }
      }
    );
  }
}
