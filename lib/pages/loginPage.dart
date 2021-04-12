import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialfoody/pages/HomePage.dart';

import 'package:socialfoody/pages/signup.dart';
import 'package:socialfoody/widgets/bezierContainer.dart';


// final GoogleSignIn gSignIn = GoogleSignIn();


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  // border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => LiveFeedPage()));
      // },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
            // borderRadius: BorderRadius.all(Radius.circular(5)),
            shadows: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff00BCD4), Color(0xff00BCD4)])),
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return InkWell(
        onTap:() {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
        },

      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
            //       color: Color(0xffc62828),
            //       borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(5),
            //           topLeft: Radius.circular(5)),
            //     ),
            //     alignment: Alignment.center,
            //     child: Text('G',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 25,
            //             fontWeight: FontWeight.w400)),
            //   ),
            // ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  // shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
                  color: Color(0xffc62828),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Google',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),

              ),
            ),
            // Expanded(
            //     child: GestureDetector(
            //       onTap: () {
            //           Navigator.push(
            //               context, MaterialPageRoute(builder: (context) => HomeScreen()));
            //         },
            //     ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Social',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff00BCD4),
          ),
          children: [
            TextSpan(
              text: 'Foody',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),

          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .20,
                  right: -MediaQuery.of(context).size.width * .5,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .18),
                      _title(),
                      SizedBox(height: 15),
                      _emailPasswordWidget(),
                      SizedBox(height: 15),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      _divider(),
                      _googleButton(),
                      SizedBox(height: height * .00002),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }
}
