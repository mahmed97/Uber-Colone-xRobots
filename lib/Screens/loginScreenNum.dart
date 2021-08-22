import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:my_app/Screens/loginScreen.dart';
import 'package:my_app/Screens/mainscreen.dart';
import 'package:my_app/Screens/otpScreen.dart';
import 'package:my_app/main.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

// CountryCode dialc = new CountryCode();
// var theDialc = dialc.dialCode;

class LoginScreenNum extends StatefulWidget {
  @override
  _LoginScreenNumState createState() => _LoginScreenNumState();
}



class _LoginScreenNumState extends State<LoginScreenNum> {

  TextEditingController phoneController = TextEditingController();

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  // final phoneController = TextEditingController();
  final otpController = TextEditingController();

  late String verificationId;
  bool showLoading = false;

  void signInWithPhoneCredential(PhoneAuthCredential phoneAuthCredential) async {

    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) { // the '?' is removed from here
        Navigator.push(
            this.context,
            MaterialPageRoute(builder: (context) => LoginScreen()),);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldkey.currentState!.showSnackBar(SnackBar(content: Text("e.message")));
    }
}

getMobileFormWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Top Text
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text("Enter your mobile number",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Text(len as String),
          // Country code picker and text field
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  child: CountryCodePicker(
                    initialSelection: 'EG',
                    hideMainText: false,
                    showDropDownButton: true,
                    flagWidth: 30.0,
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                    // padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                flex: 2,
                child: Container(
                  child: TextField(
                    controller: phoneController,
                    // controller: selectedItem,
                    cursorColor: Colors.grey[800],
                    // keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16.0),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Mobile Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30.0,),

          // Description text
          Text("By continuing you may receive an SMS for verification. Message and data rates may apply.",
            style: TextStyle(
                color: Colors.grey[600],
                height: 1.7,
                fontWeight: FontWeight.w400
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
                          onPressed: () async {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),);
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
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>OTPScreen(phoneController.text))
                            );
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
    );
}

getOTPFormWidget(context) {

}

  FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    // var len = theDialc?.length ?? 0;

    return Scaffold(
      key: _scaffoldkey,
      body: Container(
        child: showLoading
        ? Center(
          child: CircularProgressIndicator(),
        )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
            ? getMobileFormWidget(context)
            : getOTPFormWidget(context),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       // Top Text
      //       SafeArea(
      //           child: Padding(
      //             padding: const EdgeInsets.only(top: 30.0),
      //             child: Text("Enter your mobile number",
      //               style: TextStyle(
      //                 fontSize: 26.0,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //       ),
      //       // Text(len as String),
      //       // Country code picker and text field
      //       Row(
      //         children: [
      //           Expanded(
      //             flex: 1,
      //             child: Container(
      //               color: Colors.grey[200],
      //               child: CountryCodePicker(
      //                 initialSelection: 'EG',
      //                 hideMainText: false,
      //                 showDropDownButton: true,
      //                 flagWidth: 30.0,
      //                 padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
      //                 // padding: EdgeInsets.symmetric(vertical: 10.0),
      //               ),
      //             ),
      //           ),
      //           SizedBox(width: 10.0,),
      //           Expanded(
      //             flex: 2,
      //             child: Container(
      //               child: TextField(
      //                 // controller: selectedItem,
      //                 cursorColor: Colors.grey[800],
      //                 keyboardType: TextInputType.number,
      //                 style: TextStyle(
      //                   color: Colors.grey[800],
      //                   fontSize: 20.0,
      //                 ),
      //                 decoration: InputDecoration(
      //                   contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16.0),
      //                   filled: true,
      //                   fillColor: Colors.grey[200],
      //                   hintText: 'Mobile Number',
      //                   border: InputBorder.none,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //
      //       SizedBox(height: 30.0,),
      //
      //       // Description text
      //       Text("By continuing you may receive an SMS for verification. Message and data rates may apply.",
      //       style: TextStyle(
      //         color: Colors.grey[600],
      //         height: 1.7,
      //         fontWeight: FontWeight.w400
      //       ),
      //       ),
      //
      //
      //       //Two buttons at the bottom
      //       Expanded(
      //         child: SafeArea(
      //           child: Row(
      //             // mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Expanded(
      //                 flex: 2,
      //                 child: Align(
      //                   alignment: FractionalOffset.bottomCenter,
      //                   child: Container(
      //                     color: Colors.grey[200],
      //                     child: FlatButton(
      //                       height: 65.0,
      //                       onPressed: () async {
      //                         // GO BACK BUTTON FUNCTIONALITY ### DONT FORGET IT ###########
      //                         // ## Remove async ##
      //                         // Navigator.pop(
      //                         //   context,
      //                         //   MaterialPageRoute(builder: (context) => LoginScreen()),);
      //                         // ############################################################
      //
      //                         PhoneAuthCredential phoneAuthCredential =
      //                             PhoneAuthProvider.credential(
      //                                 verificationId: verificationId,
      //                                 smsCode: otpController.text,
      //                             );
      //                         signInWithPhoneCredential(phoneAuthCredential);
      //
      //                       },
      //                       child: const Icon(Icons.arrow_back, size: 30.0,),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //                 flex: 9,
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(bottom: 0, right: 18.0, left: 18.0),
      //                   child: Align(
      //                     alignment: FractionalOffset.bottomCenter,
      //                       child: FlatButton(
      //                         onPressed: () async{
      //                           setState(() {
      //                             showLoading = true;
      //                           });
      //
      //                           await _auth.verifyPhoneNumber(
      //                             phoneNumber: phoneController.text,
      //                             verificationCompleted: (phoneAuthCredential) async {
      //                               setState(() {
      //                                 showLoading = false;
      //                               });
      //                             },
      //                             verificationFailed: (verificationFailed) async {
      //                               setState(() {
      //                                 showLoading = false;
      //                               });
      //                               _scaffoldkey.currentState!.showSnackBar(SnackBar(content: const Text("Failed")));
      //                             },
      //                             codeSent: (verificationId, resendingToken) async {
      //                               setState(() {
      //                                 showLoading = false;
      //                                 currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
      //                                 this.verificationId = verificationId;
      //                               });
      //                             },
      //                             codeAutoRetrievalTimeout: (verificationId) async {
      //
      //                             },
      //                           );
      //                         },
      //                         color: Colors.black,
      //                         textColor: Colors.white,
      //                         child: Padding(
      //                           padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
      //                           child: Row(
      //                             children: [
      //                               Expanded(
      //                                 child: Text("Next", textAlign: TextAlign.center,
      //                                   style: TextStyle(
      //                                       fontSize: 22.0,
      //                                       fontWeight: FontWeight.w400
      //                                   ),
      //                                 ),
      //                               ),
      //                               Icon(
      //                                 Icons.arrow_forward,
      //                                 color: Colors.white,
      //                                 size: 30,
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //             ],
      //           ),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
