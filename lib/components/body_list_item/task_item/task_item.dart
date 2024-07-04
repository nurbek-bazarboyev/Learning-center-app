
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hard_work_app/pages/grammer_page.dart';
import 'package:hard_work_app/pages/listening_page.dart';
import 'package:hard_work_app/pages/reading_page.dart';
import 'package:hard_work_app/pages/speaking_page.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        // listening task
        ListTile(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ListeningPage()));},
          leading: Icon(CupertinoIcons.play_circle_fill,color: Colors.blueAccent,size: 30,),
          title: Text("listening task",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          subtitle: Text("listen 5 times at least"),
        ),
        SizedBox(
          height: 10,
        ),

        // reading task
        ListTile(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadingPage()));},
          leading: Icon(CupertinoIcons.book_circle,color: Colors.blueAccent,size: 30,),
          title: Text("reading task",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          subtitle: Text("read 5 times at least"),
        ),
        SizedBox(
          height: 10,
        ),

        // grammer
        ListTile(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>GrammerTaskPage()));},
          leading: Icon(CupertinoIcons.book_circle,color: Colors.blueAccent,size: 30,),
          title: Text("Grammer homework",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          subtitle: Text("do all grammer tasks"),
        ),
        SizedBox(
          height: 10,
        ),

        // speaking
        ListTile(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeakingTaskPage()));},
          leading: Icon(Icons.pending_actions_sharp,color: Colors.blueAccent,size: 30,),
          title: Text("Speaking part1",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
          subtitle: Text("speak 2 min for each question at least"),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
