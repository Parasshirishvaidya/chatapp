import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }
  //Sign up
  Future<void> signUpWithEmailPassword(String email, password) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
      }
  }
  //Sign out
  Future<void> signout() async{
    return await _auth.signOut();
  }
  //Google Sign In
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication gauth = await guser!.authentication;
    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    //Sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //errors

}