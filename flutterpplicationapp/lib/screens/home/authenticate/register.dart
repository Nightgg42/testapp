import 'package:flutter/material.dart';
import 'package:flutterpplicationapp/screens/service/auth.dart';
import 'package:flutterpplicationapp/shared/constants.dart';
import 'package:flutterpplicationapp/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   
   final AuthService _auth = AuthService();
   final _formkey = GlobalKey<FormState>();
   bool loading = false;

  String email ='';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[500],
        elevation: 0.0,
        title:Text('Sign Up to AppChat',style:TextStyle(color: Colors.black,)) ,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0) ,
        child: Form(
          key: _formkey,
          child:Column(
            children:<Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: TextInputDecoration.copyWith(hintText:'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null ,
                onChanged:(val){
                  setState(() => email = val);
                }
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: TextInputDecoration.copyWith(hintText:'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter an password 6+ chars long' : null ,
                onChanged:(val){
                  setState(() => password = val);

                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.blue[500],
                child: Text('Register',
                style: TextStyle(color: Colors.black),
                ),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                    setState(() => loading = true
                      
                    );
                  dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                  if(result == null){
                    setState(() {error = 'Plase a valid Email';
                    loading = false;
                    }) ;
                  }
                  }
                }
              ),
              SizedBox(height:12.0),
              Text(error,style:TextStyle(color:Colors.red,fontSize: 16.0),
              ),
            ],
          ),
        )
      ),
    );
  }
}