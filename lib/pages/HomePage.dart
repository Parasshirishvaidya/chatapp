import 'package:chatappv2/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(){
    final _authService = AuthServices();
    _authService.signout();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home Page"),
      actions: [
        IconButton(onPressed: logout, icon: Icon(Icons.logout))
      ],),
    );
  }
}
