import 'package:flutter/material.dart';
import 'package:flutterpplicationapp/models/user.dart';
import 'package:flutterpplicationapp/screens/home/authenticate/authenticate.dart';
import 'package:flutterpplicationapp/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    }else{
      return Home();

    }
  }
}