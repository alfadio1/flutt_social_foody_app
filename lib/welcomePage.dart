import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:socialfoody/pages/loginPage.dart';
import 'package:socialfoody/pages/signup.dart';
import 'package:socialfoody/widgets/size.dart';



class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  Widget _signInButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
            // borderRadius: BorderRadius.all(Radius.circular(5)),
            shadows: <BoxShadow>[
              BoxShadow(
                  color: Color(0xff00BCD4).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: 20, color: Color(0xff00BCD4)),
        ),

      ),
    );

  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
          // borderRadius: BorderRadius.all(Radius.circular(5)),
          // borders: Border.all(color: Colors.grey, width: 2),
          shadows: <BoxShadow>[
            BoxShadow(
                color: Color(0xff000000).withAlpha(100),
                offset: Offset(2, 4),
                // blurRadius: 8,
                spreadRadius: 2)
          ],
        ),
        child: Text(
          'Sign Up now',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );

    // return RaisedButton(
    //   onPressed: () {
    //
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (context) => SignUpPage()));
    //   },
    //
    //   color: Colors.white,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20.0)),
    //   child: Text(
    //     'Sign In',
    //     style: TextStyle(fontSize:20, color: Colors.black),
    //   ),
    // );
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
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Foody',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),

          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00BCD4), Color(0xff00BCD4)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _signInButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              //_label()
            ],
          ),
        ),
      ),
    );
  }


}



