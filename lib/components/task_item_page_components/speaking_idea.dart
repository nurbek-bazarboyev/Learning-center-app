import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hard_work_app/components/model/speaking_questions_model.dart';

class IdeaOfSpeaking extends StatelessWidget {
  final int part;
  const IdeaOfSpeaking({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: Colors.orangeAccent.withOpacity(.1),
        child: ListView.builder(
            itemBuilder: (context, index){
              List<String> title = parts[part]!["ideas"]!.keys.toList();
              List<String> quesTitle = parts[part]!["ideas"]![title[index]]!.keys.toList();
          return ExpansionTile(
              title: Text("${index+1}) ${title[index]}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
            children: [
              Container(
                color: Colors.orangeAccent.withOpacity(.2),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                height: size.height * .7,
                child: ListView.builder(
                    itemCount: quesTitle.length,
                    itemBuilder: (context,each)=>Text("${each+1}. ${quesTitle[each]}\n${parts[part]!["ideas"]![title[index]]![quesTitle[each]]!.toString()}\n",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
              ),

            ]

          );
        },
            itemCount: parts[part]!["ideas"]!.length
        ),
      ),
    );
  }
}
