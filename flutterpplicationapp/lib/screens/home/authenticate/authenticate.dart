import 'package:flutter/material.dart';
import 'package:flutterpplicationapp/screens/home/authenticate/register.dart';
import 'package:flutterpplicationapp/screens/home/authenticate/sign_in_.dart';

class Authenticate extends  StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }
  }
}