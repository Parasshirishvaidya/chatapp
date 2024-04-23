

import 'package:chatappv2/auth/auth_service.dart';
import 'package:chatappv2/components/my_button.dart';
import 'package:chatappv2/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:chatappv2/themes/light_mode.dart';

class LoginPage extends StatelessWidget {
  // email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async{
    final authService = AuthServices();
    try{
      await authService.signInWithEmailPassword(_emailController.text,_pwController.text);
    }
    catch(e){
      showDialog(context: context, builder: (context)=> AlertDialog(title: Text(e.toString())));
    }
    //try login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.message,
            size: 60,
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),

          const SizedBox(height: 50,),

          // Welcome Back message
          Text("Welcome Back",
            style: TextStyle(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              fontSize: 16,
            ),),

          //email textfield
          MyTextField(
              hintText: "Email", obscureText: false,
              controller: _emailController),

          const SizedBox(height: 10,),

          //pw textfield
          MyTextField(
            hintText: "Password", obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 10,),

          //loginbutton
          Mybutton(
              text:"Submit",
              onTap:()=>login(context)),

          const SizedBox(height: 10,),

          //register
          Text("Not a member?"),
          GestureDetector(
              onTap: onTap,
              child: Text("Register now",style:TextStyle(fontWeight: FontWeight.w900) ,)),
        ],
      )),
    );
  }
}
