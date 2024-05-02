import 'package:chatappv2/services/auth/auth_service.dart';
import 'package:chatappv2/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home Page"),

      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {

          if(snapshot.hasError) {
            return const Text("Error");
          }

          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
          );
        },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {

    if(userData["email"] != _authServices.getCurrentUser()!.email){
      return UserTile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                  ),
              ),
            );
          }
      );
    }else{
      return Container();
    }
  }
}
