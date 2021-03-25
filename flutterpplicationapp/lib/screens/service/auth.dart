import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterpplicationapp/models/user.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user
  User _userFormFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid ): null;
  }

//auth change
  Stream<User> get user{
    return _auth.onAuthStateChanged
    // .map((FirebaseUser user) =>_userFormFirebaseUser(user));
    .map(_userFormFirebaseUser);

  }

  


  // sign in
  Future signInAnon() async {
  try {
      AuthResult result = await _auth.signInAnonymously();
       FirebaseUser user = result.user;
  return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password
Future signInWithEmailAndPassword(String email,password) async{
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFormFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null ;
  }
}


  // reginiser with email & password
Future registerWithEmailAndPassword(String email,password) async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFormFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null ;
  }
}


  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null ;

    }
  }

}