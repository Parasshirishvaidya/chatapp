import 'package:chatappv2/auth/auth_gate.dart';
import 'package:chatappv2/firebase_options.dart';
import 'package:chatappv2/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:chatappv2/themes/light_mode.dart';
import 'package:chatappv2/pages/login_page.dart';
import 'package:chatappv2/pages/register_page.dart';
<<<<<<< Updated upstream
import 'package:chatappv2/auth/login_or_register.dart';
import 'package:chatappv2/auth/login_or_register.dart';
=======
<<<<<<< Updated upstream
import 'package:chatappv2/services/auth/login_or_register.dart';
import 'package:chatappv2/services/auth/login_or_register.dart';
=======
import 'package:chatappv2/auth/login_or_register.dart';
import 'package:chatappv2/auth/login_or_register.dart';
=======
import 'package:provider/provider.dart';
//import 'package:chatappv2/pages/login_page.dart';
//import 'package:chatappv2/pages/register_page.dart';
//import 'package:chatappv2/services/auth/login_or_register.dart';
//import 'package:chatappv2/services/auth/login_or_register.dart';
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => Themeprovider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<Themeprovider>(context).themedata,
    );
  }
}
