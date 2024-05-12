import 'package:flutter/material.dart';
import 'package:chatappv2/components/my_button.dart';
import 'package:chatappv2/components/my_textfield.dart';
import 'package:chatappv2/services/auth/auth_service.dart';
import 'package:chatappv2/pages/chat_page.dart';
class register_page extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cnfpwController = TextEditingController();
  void register(BuildContext context){
    final _auth = AuthServices();
     if(_pwController.text == _cnfpwController.text){
       try{
         _auth.signUpWithEmailPassword( _emailController.text, _pwController.text);
       }catch (e){
         showDialog(context: context, builder:(context)=>AlertDialog(
           title: Text(e.toString()),
         ));
       }
   }
  }
  final void Function()? onTap;

  register_page({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
                  controller: _emailController,),

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

              const SizedBox(height: 20,),

              //loginbutton
              Mybutton(text: "Register", onTap: () => register(context),),

              Row(
                children: [
                  Expanded(child: Divider(thickness: 0.5,
                      color: Colors.black),),
                  Text("Or Continue with"),
                  Expanded(child: Divider(thickness: 0.5,
                      color: Colors.black))
                ],
              ),

              const SizedBox(height: 20),

              GestureDetector(child:Image(image: AssetImage('images/google.jpeg'),height: 100,width: 100,),onTap:()=> AuthServices().signInWithGoogle(),),


              const SizedBox(height: 20),

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
