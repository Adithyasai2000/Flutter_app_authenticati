import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_authentication/LanguagePage.dart';

enum Selector{SHIPPER,TRANSPORTER}
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Selector selctor;
  FirebaseAuth auth=FirebaseAuth.instance;
  String id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.currentUser().then((onValue){
      setState(() {
        id=onValue.toString();
      });
    });
    print("userid");
    print(id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(

        children: <Widget>[

          Padding(
            padding:const EdgeInsets.fromLTRB(60, 200, 60, 0),
            child:Text(
              "Please Select your profile",style: TextStyle(fontSize: 28,fontStyle: FontStyle.normal,color: Colors.black),
            )
          ),
          Padding(
            padding:const EdgeInsets.fromLTRB(20, 260, 20, 0),
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child:  ListTile(
                title: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:Image(
                                image: AssetImage("Asserts/prologo1.jpg"),
                                height: 50,
                                width: 50,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child:Container(
                                width: 200,
                                height: 80,
                                child: Column(
                                  //mainAxisAlignment:MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Shipper",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                    ),
                                    ),
                                    Text(" dkfj dfk jskdfg dfmsfnkldnn fk"

                                    ),
                                  ],
                                ),
                              )
                            ),



                          ],
                        ),


                      ],
                    ),

                  ),


                ),
                leading: Radio(
                  value: Selector.SHIPPER,
                  groupValue: selctor,
                  onChanged: (value) {
                    setState(() {
                      selctor = value;
                    });
                  },
                ),
              ),

            ),
          ),
          Padding(
            padding:const EdgeInsets.fromLTRB(20, 390, 20, 0),
            child:Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child:  ListTile(
                title: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:Image(
                                image: AssetImage("Asserts/prologo1.jpg"),
                                height: 50,
                                width: 50,
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child:Container(
                                  width: 200,
                                  height: 80,
                                  child: Column(
                                    //mainAxisAlignment:MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Transporter",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                        ),
                                      ),
                                      Text(" dkfj dfk jskdfg dfmsfnkldnn fk"

                                      ),
                                    ],
                                  ),
                                )
                            ),



                          ],
                        ),


                      ],
                    ),

                  ),


                ),
                leading: Radio(
                  value: Selector.TRANSPORTER,
                  groupValue: selctor,
                  onChanged: (value) {
                    setState(() {
                      selctor = value;
                    });
                  },
                ),
              ),

            ),
          ),
          Padding(
              padding:const EdgeInsets.fromLTRB(50, 530, 50, 0),
              child:ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(
                  child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20)),
                  color: Colors.indigo,
                  onPressed: (){},
                ),
              )
          ),
          Padding(
              padding:const EdgeInsets.fromLTRB(50, 590, 50, 0),
              child:ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(
                  child: Text("LOGOUT",style: TextStyle(color: Colors.white,fontSize: 20)),
                  color: Colors.indigo,
                  onPressed: () async {
                    await auth.currentUser().then((onValue){
                      print(onValue);
                      this.id=onValue.toString();
                    });
                    print(this.id);
                    FirebaseAuth.instance.signOut();
                    print("signout ayenda");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LanguagePage()));

                  },
                ),
              )
          ),


        ],
      ),
    );
  }
}
