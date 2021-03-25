
import 'package:flutter/material.dart';
import 'package:flutterpplicationapp/screens/service/auth.dart';
import 'package:flutterpplicationapp/screens/wrapper.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:provider/provider.dart';
import 'package:flutterpplicationapp/models/user.dart';



void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'App chat';


  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          initialData: null,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
    
  }
}

