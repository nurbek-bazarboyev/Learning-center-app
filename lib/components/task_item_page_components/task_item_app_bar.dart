import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildTaskItemAppBar(BuildContext context,String title) {
  return AppBar(
    actions: [SizedBox(width: 40,)],
    leading: IconButton(
        onPressed: (){Navigator.pop(context);},
        icon: Icon(CupertinoIcons.back,color: Colors.white,)),
    backgroundColor: Colors.indigo,
    title: Center(
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}