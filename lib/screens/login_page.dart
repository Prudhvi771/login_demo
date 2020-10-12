import 'package:flutter/material.dart';
import 'package:login_demo/screens/first_screen.dart';
import 'package:login_demo/screens/register.dart';
import 'package:login_demo/screens/signIn.dart';
import 'package:login_demo/screens/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: OutlineButton(
                  child: Text("SignIn"),
                  onPressed: () => _pushPage(context, SignIn()),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
              ),
              Container(
                child: OutlineButton(
                  child: Text("Register"),
                  onPressed: () => _pushPage(context, Register()),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
              ),
              Container(
                child:OutlineButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return FirstScreen();
                            },
                          ),
                        );
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
