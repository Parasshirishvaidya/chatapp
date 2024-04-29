import 'package:chatappv2/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatappv2/pages/HomePage.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user s logged in
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return login_or_register();
          }

        },
      )
    );
  }
}
