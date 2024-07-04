import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hard_work_app/pages/chat_pages/chat_page.dart';
import 'package:hard_work_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
class ChatHomePage extends StatefulWidget {
  final String title;
  final bool isCoder;
  const ChatHomePage({super.key, required this.title,  this.isCoder=false});

  @override
  State<ChatHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<ChatHomePage> {
  void signOut(){
    // get auth service
    final auth = Provider.of<AuthService>(context,listen: false);
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Center(child: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 26),),),
        backgroundColor: Colors.indigo,
        actions: [
          SizedBox(width:40),
        ],
      ),

      body: widget.isCoder ? ChatPage(
        receiverUserEmail: "dasturchi@gmail.com",
        receiverUserID: "ZUpcZ8XLbsNdoUIEzA0xlAG0WCU2",
      ) : _buildUserList(),
    );
  }

  // build user list
  Widget _buildUserList (){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasError){return Text("error");}
          if(snapshot.connectionState == ConnectionState.waiting){return Text("Loading..");}
          return ListView (
            children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
          );
        }
    );
  }

  // build individual buil list item
  Widget _buildUserListItem(DocumentSnapshot documentSnapshot){
    Map<String, dynamic> data = documentSnapshot.data()! as Map<String, dynamic>;

    // display all the users except the current user
    if(FirebaseAuth.instance.currentUser!.email != data['email'] && data['email'] != "dasturchi@gmail.com"){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Text("${data['email'][0]}"),
            ),
            title: Text(data['email'],style: TextStyle(color: Colors.black),),
            onTap: (){
              //pass the user's uid to the chat page
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              )));
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 60),
            height: 1,
            color: Colors.grey,)
        ],
      );
    }
    else {
      // return empty container
      return Container();
    }

  }

}
