import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_authentication/HomePage.dart';
import 'package:flutter_app_authentication/LanguagePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuth.instance;
runApp(MyApp());}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.




  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      title: 'Flutter Demo',
      home:somebuilder(),
    );
  }
 

}
class somebuilder extends StatefulWidget {



  @override
  _somebuilderState createState() => _somebuilderState();
}
enum LoginState{LOGIN,LOGOUT}

class _somebuilderState extends State<somebuilder> {
  FirebaseAuth _auth;
  LoginState statee;
  String ji;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginState state=LoginState.LOGOUT;
    _auth=FirebaseAuth.instance;
    _auth.currentUser().then((useruid){
        setState(() {
          useruid.toString()==null?this.statee=LoginState.LOGOUT:this.statee=LoginState.LOGIN;
        });
        ji=useruid.toString();
    });
    print("ik");
    print(ji);



    //print(user);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:this.statee==LoginState.LOGOUT?LanguagePage():HomePage(),
    );
  }

}

