import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hard_work_app/components/task_item_page_components/speaking_idea.dart';
import 'package:hard_work_app/components/task_item_page_components/speaking_parts.dart';
class SpeakingPart extends StatefulWidget {
  final int part;
  const SpeakingPart({super.key, required this.part});

  @override
  State<SpeakingPart> createState() => _SpeakingPartState();
}

class _SpeakingPartState extends State<SpeakingPart> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      animationDuration: Duration(milliseconds: 600),
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
          backgroundColor: Colors.indigo,
          bottom: TabBar(
            indicatorColor: Colors.yellowAccent,
              labelColor: Colors.yellowAccent,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(child: Text("Part ${widget.part}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),),
                Tab(child: Text("Ideas",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),)

              ]),
        ),
        body: TabBarView(
            children: [
          PartOfSpeaking(part: widget.part,),
          IdeaOfSpeaking(part: widget.part,),
        ]),
      ),
    );
  }
}
