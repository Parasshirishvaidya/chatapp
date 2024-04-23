import 'package:flutter/material.dart';
import 'package:chatappv2/components/my_button.dart';
import 'package:chatappv2/components/my_textfield.dart';

class register_page extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cnfpwController = TextEditingController();
  void register(){}
  final void Function()? onTap;

  register_page({super.key, required this.onTap});

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
              Text("Create an Account",
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

              MyTextField(
                hintText: "Confirm Password", obscureText: true,
                controller: _cnfpwController,
              ),

              const SizedBox(height: 10,),

              //loginbutton
              Mybutton(text: "Register", onTap: register,),

              const SizedBox(height: 10,),

              //signin
              Text("Already a member?"),
              GestureDetector(
                onTap: onTap,
                child: Text("Sign in",style:TextStyle(fontWeight: FontWeight.w900) ,),)
            ],
          )),
        );
  }
}
