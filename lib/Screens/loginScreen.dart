import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/Screens/loginScreenNum.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF276ef1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 90.0,),
          Container(
            alignment: Alignment.center,
            child: Image(image: AssetImage("images/logo.png"),
              width: 100.0,
              height: 100.0,
            ),
          ),
          SizedBox(height: 80.0,),
          // SvgPicture.asset('images/Asset3.svg',
          // height: 200,
          // ),
          Image(image: AssetImage("images/Asset1.png"),
            width: 220.0,
            height: 220.0,
          ),
          SizedBox(height: 70.0,),
          Text("Move with birdy",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0, right: 18.0, left: 18.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SafeArea(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreenNum()),);
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Get Started", textAlign: TextAlign.center,
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
          )
        ],
      ),
    );
  }
}


