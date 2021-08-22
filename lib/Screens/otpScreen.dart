import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screens/loginScreenNum.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Screens/mainscreen.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'loginScreen.dart';

class OTPScreen extends StatefulWidget {

  final String phone;
  OTPScreen(this.phone);
  // const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _verificationId;

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();


  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.red[200],
    borderRadius: BorderRadius.circular(0.0),
    border: Border.all(
      color: Colors.red,
    ),
  );

  final BoxDecoration pinPutDecoration2 = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(0.0),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Top Text
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text("Verify +2${widget.phone}",
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // Text(len as String),
              // Country code picker and text field
              Container(
                color: Colors.grey[200],
              ),
              SizedBox(width: 10.0,),
              Expanded(
                flex: 2,
                child: Container(
                    child: PinPut(
                      fieldsCount: 6,
                      withCursor: true,
                      textStyle: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                      eachFieldWidth: 45.0,
                      eachFieldHeight: 45.0,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration2,
                      selectedFieldDecoration: pinPutDecoration2,
                      followingFieldDecoration: pinPutDecoration2,
                      pinAnimationType: PinAnimationType.fade,
                      onSubmit: (pin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationId, smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainScreen()),
                                      (route) => false);
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          showToast("Invalid OTP", Colors.red);
                        }
                      },
                    ),
                ),
              ),


              //Two buttons at the bottom
              Expanded(
                child: SafeArea(
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            color: Colors.grey[200],
                            child: FlatButton(
                              height: 65.0,
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),);

                                // PhoneAuthCredential phoneAuthCredential =
                                // PhoneAuthProvider.credential(
                                //   verificationId: verificationId,
                                //   smsCode: otpController.text,
                                // );
                                // signInWithPhoneCredential(phoneAuthCredential);

                              },
                              child: const Icon(Icons.arrow_back, size: 30.0,),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0, right: 18.0, left: 18.0),
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: FlatButton(
                              onPressed: () async{

                              },
                              color: Colors.black,
                              textColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text("Next", textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async{
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async{
                if (value.user != null) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                          (route) => false);
                }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId){
          setState(() {
            _verificationId = verificationId;
          });
        }
        , timeout: Duration(seconds: 60));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
