import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login/utils/login_methods.dart';

import 'package:social_login/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';
  String email = '';
  var responseValue;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Google Login")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            isLoggedIn
                ? Container()
                : SocialLoginButton(
                    onPressed: () {
                      googleSignInProcess(context).then((value) {
                        setState(() {
                          isLoggedIn = true;
                          responseValue = value;
                          name = value.displayName!;
                          email = value.email!;
                        });
                      });
                    },
                    icon: "assets/google.png",
                    buttonColor: Colors.white,
                    buttonText: "Sign In With Goolge",
                    buttonTextColor: Colors.black,
                    height: 50,
                  ),
            !isLoggedIn || responseValue == null
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(email),
                    ],
                  ),
            !isLoggedIn || responseValue == null
                ? Container()
                : TextButton(
                    onPressed: () {
                      GoogleSignIn().signOut().then((value) {
                        setState(() {
                          isLoggedIn = false;
                          responseValue = value;
                        });
                      });
                    },
                    child: const Text("Logout"))
          ]),
        ));
  }
}
