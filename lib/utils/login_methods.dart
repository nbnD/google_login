import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/google_signin_model.dart';

//Google SignIn Process


Future<GoogleSignInModel> googleSignInProcess(BuildContext context) async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;
  GoogleSignInModel socialGoogleUser = GoogleSignInModel(
      displayName: googleUser?.displayName,
      email: googleUser?.email,
      photoUrl: googleUser?.photoUrl,
      id: googleUser?.id,
      token: token);
  
  Fluttertoast.showToast(
      msg: "Welcome",
      backgroundColor: Colors.green,
      textColor: Colors.white);
  
   return socialGoogleUser;
}
