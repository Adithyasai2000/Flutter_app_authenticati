import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_authentication/PhoneAuthentication.dart';

class LanguagePage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => new _LanguagePage();
}
class _LanguagePage extends State<LanguagePage> with SingleTickerProviderStateMixin{

  String dropdownValue = 'English';
  List <String> spinnerItems = [
    'English',
    'Telugu',
    'Hindi',
  ] ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,

        children: <Widget>[
          Image(
            image: new AssetImage("Asserts/prologod.png"),
            fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken

          ),
          SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: new Image(
                    image: new AssetImage("Asserts/prologo1.jpg"),
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Text(
                    "Please select your Language",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child:Center(
                    child: Text(
                      "You can change the language at any time ",
                      style: TextStyle(


                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child:Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                    child: DropdownButtonHideUnderline(
                         child:ButtonTheme(
                           alignedDropdown:true,
                           child:DropdownButton<String>(
                             value: dropdownValue,
                             onChanged: (String data) {
                               setState(() {
                                 dropdownValue = data;
                               });
                             },
                             items:spinnerItems.map<DropdownMenuItem<String>>((String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 child: Text(value),
                               );
                             }).toList(),
                             elevation: 16,

                           ),
                         ),
                       ),

               ),),


            Padding(
              padding:const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child:ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: 50,
                child: FlatButton(

                  child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 20)),
                  hoverColor: Colors.indigo,
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: (){
                    runApp(MaterialApp(home: new Scaffold(
                      body: PhoneAuthentication())));
                  },



                ) ,
              ),

            )

              ],
            ),
          )




        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}