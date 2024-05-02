<<<<<<< Updated upstream
import 'dart:html';

=======
//import 'dart:html';

import 'package:chatappv2/components/chat_bubble.dart';
>>>>>>> Stashed changes
import 'package:chatappv2/components/my_textfield.dart';
import 'package:chatappv2/services/auth/auth_service.dart';
import 'package:chatappv2/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

<<<<<<< Updated upstream
class ChatPage extends StatelessWidget{
  final String receiverEmail;
  final String receiverID;

   ChatPage({
=======
class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({
>>>>>>> Stashed changes
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

<<<<<<< Updated upstream
final TextEditingController _messageController = TextEditingController();

final ChatService _chatService = ChatService();
final AuthServices _authService = AuthServices();


void sendMessage () async {
  if(_messageController.text.isNotEmpty)
  {
    await _chatService.sendMessage(receiverID,_messageController.text);


    _messageController.clear();
  }
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail),),
      body: Column(
        children: [
          Expanded(child:_buildMessageList(),

          ),
          _buildUserInput(),
        ],

      ),
    );
  }
  Widget _buildMessageList()
  {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID,senderID),
     builder:(context, snapshot){

      if(snapshot.hasError)
      {
        return const Text("ERROR");
      }

      if(snapshot.connectionState == ConnectionState.waiting)
      {
        return const Text("Loading....");

      }
      return ListView(
children:snapshot.data!.docs.map((doc)=>_buildMessageItem(doc)).toList(),
      );

     },
     );
  }

     Widget _buildMessageItem(DocumentSnapshot doc)
     {
      Map<String, dynamic> data = doc.data() as Map<String> , dynamic>;
      bool isCurrentUser = data['senderID']== _authService.getCurrentUser()!.uid;
      var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

      return Container(
        alignment: alignment,
        child: Text(data['message']),
      );
     }


     Widget _buildUserInput()
     {
      return Row(
        children: [
          Expanded(child: MyTextField(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,

          ),),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward),),
        ],

      );
     }
  
}
=======
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthServices _authService = AuthServices();
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () => scrolldown());
      }
    });
    Future.delayed(const Duration(milliseconds: 500), () => scrolldown());
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  void scrolldown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);

      _messageController.clear();
    }
    scrolldown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.lightGreenAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(widget.receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("ERROR");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading....");
        }
        return ListView(
          controller: _scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Chatbubble(
            message: data["message"],
            isCurrentUser: isCurrentUser,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
              focusNode: myFocusNode,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(right: 25),
              child: IconButton(
                onPressed: sendMessage,
                icon: Icon(
                  Icons.arrow_upward,
                  color: Colors.white24,
                ),
              )),
        ],
      ),
    );
  }
}
>>>>>>> Stashed changes
