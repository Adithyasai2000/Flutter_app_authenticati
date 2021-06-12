
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_authentication/HomePage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

enum MobileVerificationState{NUMBER_STATE,OTP_STATE}
class PhoneAuthentication extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>new _PhoneAuthentication();
}
class _PhoneAuthentication extends State<PhoneAuthentication> with SingleTickerProviderStateMixin{

  FirebaseAuth auth=FirebaseAuth.instance;
  MobileVerificationState currentstate=MobileVerificationState.NUMBER_STATE;
  TextEditingController phoneController = TextEditingController();
  String OTPpin,verificationId;
  @override
  void initState() {

  }
numberValidator(){

}
otpwidget(context){
    return(
    SingleChildScrollView(
      child: Column(
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
              "Verify Phone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
            child:Center(
              child: Text(
                "Code sent to to "+phoneController.text,
                style: TextStyle(


                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
            child: OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 40,
              style: TextStyle(
                  fontSize: 27
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                OTPpin=pin;
                print("Completed: " + pin);
              },

            ),

          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 5),
            child:Center(
              child: Text(
                "Didn't receive the code? Request Again",
                style: TextStyle(


                ),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.fromLTRB(50, 5, 50, 5),
            child:ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 50,
              child: FlatButton(

                child: Text("VERIFY AND CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20)),
                hoverColor: Colors.indigo,
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: () async{
                  print("verification cede");
                  print(this.verificationId);
                  print("otp chudu");
                  print(OTPpin);

                  //print("vhdasdg"+this.verificationId);//signInWithPhoneAuthCredential(PhoneAuthProvider.getCredential(verificationId: this.verificationId, smsCode: OTPpin));
                  try {
                    final authCredential = await auth.signInWithCredential(
                        PhoneAuthProvider.getCredential(
                            verificationId: this.verificationId,
                            smsCode: this.OTPpin));
                    if(authCredential.user != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    }
                  }catch(e){
                    print(e.toString());
                  }
                },



              ) ,
            ),

          )

        ],
        
      ),
    )
    );
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body:currentstate==MobileVerificationState.NUMBER_STATE? new Stack(
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
                    "Please enter your mobile number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child:Center(
                    child: Text(
                      "You'll receive a 6 digit code to verify next ",
                      style: TextStyle(


                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5,  50,5),
                  child: Container(
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child:Image(
                                  image: AssetImage("Asserts/IndiaFlag.png"),
                                  height: 30,
                                  width: 30,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child:Text(
                                    "+91"
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child:SizedBox(
                                  width: 200,
                                  child:TextField(
                                    controller: phoneController,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.black,
                                    

                                  ),
                                ),
                              ),


                            ],
                          ),


                        ],
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child:ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: FlatButton(

                      child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontSize: 20)),
                      hoverColor: Colors.indigo,
                      color: Colors.indigo,
                      textColor: Colors.white,
                      onPressed: (){
                         auth.verifyPhoneNumber(phoneNumber:"+91"+phoneController.text, timeout: const Duration(seconds: 60), verificationCompleted:verified, verificationFailed: null, codeSent:oncodesent(verificationId), codeAutoRetrievalTimeout: null);
                         //auth.verifyPhoneNumber(phoneNumber: null, timeout: null, verificationCompleted: null, verificationFailed: null, codeSent: null, codeAutoRetrievalTimeout: null)
                       
                      },



                    ) ,
                  ),

                )

              ],
            ),
          )
        ],
      ):otpwidget(context),
    );
  }
  oncodesent(verificationid) {
    print(verificationid);
    setState(() {
      this.verificationId=verificationId;
      currentstate=MobileVerificationState.OTP_STATE;
    });
  }

  void  signInWithPhoneAuthCredential( phoneAuthCredential) async {

    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }  }catch (e) {
      print(e);

    }
  }

  void verified(AuthCredential phoneAuthCredential) {
    try{
      final authCredential= auth.signInWithCredential(phoneAuthCredential);
      if(authCredential!= null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }
    }catch(e){

    }
  }
}