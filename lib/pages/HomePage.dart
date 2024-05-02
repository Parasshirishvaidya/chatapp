import 'package:chatappv2/auth/auth_service.dart';
import 'package:flutter/material.dart';

<<<<<<< Updated upstream
class HomePage extends StatelessWidget {
  const HomePage({super.key});
=======
<<<<<<< Updated upstream
import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

=======
class HomePage extends StatelessWidget {
<<<<<<< Updated upstream
  const HomePage({super.key});
>>>>>>> Stashed changes
>>>>>>> Stashed changes

  void logout(){
    final _authService = AuthServices();
    _authService.signout();
  }

=======
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      appBar: AppBar(title:Text("Home Page"),
      actions: [
        IconButton(onPressed: logout, icon: Icon(Icons.logout))
      ],),
    );
  }
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream

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
=======
=======
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.lightGreenAccent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
>>>>>>> Stashed changes
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
<<<<<<< Updated upstream

    if(userData["email"] != _authServices.getCurrentUser()!.email){
=======
    if (userData["email"] != _authServices.getCurrentUser()!.email) {
>>>>>>> Stashed changes
      return UserTile(
          text: userData["email"],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
<<<<<<< Updated upstream
                  ),
              ),
            );
          }
      );
    }else{
      return Container();
    }
  }
=======
                ),
              ),
            );
          });
    } else {
      return Container();
    }
  }
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
}
