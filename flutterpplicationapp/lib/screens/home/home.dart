import 'package:flutter/material.dart';
import 'package:flutterpplicationapp/screens/service/auth.dart';


class Home extends  StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
                return Scaffold(
                  backgroundColor: Colors.cyan[50],
                  appBar: AppBar(
                    title: Text('AppChat',style:TextStyle(color: Colors.black,)),
                    backgroundColor: Colors.cyan[500], 
                    elevation: 0.0,
                    actions: <Widget>[
                      FlatButton.icon(
                        icon: Icon(Icons.person),
                        label: Text('Log Out'),
                        onPressed: ()async{
                          await _auth.signOut();
                        },
          )
        ],
      ),

    );
  }
}

