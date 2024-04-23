import 'package:chatappv2/pages/login_page.dart';
import 'package:chatappv2/pages/register_page.dart';
import 'package:flutter/material.dart';

class login_or_register extends StatefulWidget {
  const login_or_register({super.key});

  @override
  State<login_or_register> createState() => _login_or_registerState();
}

class _login_or_registerState extends State<login_or_register> {
  //initially show login page
  bool showLoginPage = true;

  // toggle to switch between two pages
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      //return LoginPage(onTap: onTap);
      return LoginPage(onTap: togglePages);
    }
    else{
      return register_page(onTap: togglePages);
    }
  }
}
