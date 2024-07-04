import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hard_work_app/components/body_list_item/home_components/chat/chat_bubble.dart';
import 'package:hard_work_app/components/body_list_item/home_components/chat/my_chat_text_field.dart';
import 'package:hard_work_app/services/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail, receiverUserID;
  final String? buy;
  const ChatPage(
      {super.key,
        required this.receiverUserEmail,
        required this.receiverUserID,
        this.buy=''});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void sendMessage() async {
    // only send a message if there is smth to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      // clear the condtroller after sending a message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _messageController.text = widget.buy??"Enter text";
    return widget.receiverUserID=="dasturchi@gmail.com"?Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          // messages
          Expanded(child: _buildmessageList()),

          // user intput
          _buildmessageInput()
        ],
      ),
    ):widget.receiverUserEmail!="dasturchi@gmail.com"?Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
        backgroundColor: Colors.indigo,
        title: Text(widget.receiverUserEmail,style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // messages
            Expanded(child: _buildmessageList()),

            // user intput
            _buildmessageInput()
          ],
        ),
      ),
    ):SizedBox(
      height: size.height,
      width: size.width,
      child: Scaffold(

        body: Column(
          children: [
            // messages
            Expanded(child: _buildmessageList()),

            // user intput
            _buildmessageInput()
          ],
        ),
      ),
    );
  }

  // build message list
  Widget _buildmessageList() {
    return StreamBuilder(
        stream: _chatService.getMessage(
            widget.receiverUserID, _auth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading..');
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildmessageItem(doc))
                .toList(),
          );
        });
  }

  // build message item
  Widget _buildmessageItem(DocumentSnapshot document) {

    //////////////////////////////////////////////////////////////
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
   var alignment = (data['senderId'] == _auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      padding: EdgeInsets.only(left: alignment==Alignment.centerRight?60:0,right: alignment==Alignment.centerLeft?60:0),
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data['senderId'] == _auth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data['senderId'] == _auth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("${data["senderEmail"]}"),
          ),
          ChatBubble(message: data['message']),
        ],
      ),
    );
  }

  // build message input
  Widget _buildmessageInput() {
    return Row(
      children: [
        // textfield
        Expanded(
            child: MyChatTextField(
                controller: _messageController,
                hintText: widget.buy! !='' ? widget.buy!: 'Enter message'  ,
                obscureText: false)),
        IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send_rounded,
              color: Colors.blue,
              size: 40,
            ))
      ],
    );
  }
}
