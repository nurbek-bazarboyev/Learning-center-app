import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hard_work_app/components/model/reading_model.dart';
class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
 bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text("Read 5 times",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
      ),
      body: Material(
        child: SafeArea(
          child: Container(
            //padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            color: Colors.orangeAccent.withOpacity(.05),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${articles["topic"].toString()}.\n",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    Text(articles["text"].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
