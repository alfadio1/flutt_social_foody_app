import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialfoody/pages/loginPage.dart';


final GoogleSignIn gSignIn = GoogleSignIn();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSignedIn= false;

  void initState(){
    super.initState();

    gSignIn.onCurrentUserChanged.listen((gSigninAccount) {
      controlSignIn(gSigninAccount);
    }, onError: (gError){
      print("Error message: "+ gError);
    });
    gSignIn.signInSilently(suppressErrors: false).then((gSignInAccount){
      controlSignIn(gSignInAccount);
    }).catchError((gError){
      print("Error message: "+ gError);
    });
  }
  controlSignIn(GoogleSignInAccount signInAccount) async {
    if(signInAccount != null)
    {
      setState(() {
        isSignedIn = true;
      });
    }
    else
    {
      isSignedIn = false;
    }

  }
  loginUser(){
    gSignIn.signIn();

  }

  logoutUser(){
    gSignIn.signOut();
  }


  Widget buildHomeScreen(){
    return RaisedButton.icon(onPressed: logoutUser, icon: Icon(Icons.close), label: Text("Sign Out"));
  }
  // ignore: missing_return
  Widget buildSignInScreen(){

  }
  @override
  Widget build(BuildContext context){
    if(isSignedIn)
    {
      return buildHomeScreen();
    }
    else
    {
      return LoginPage();
    }

  }

}










// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:socialfoody/provider/google_sign_in.dart';
// import 'package:socialfoody/pages/logged_in.dart';
// import 'package:socialfoody/pages/loginPage.dart';
// import 'package:provider/provider.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) =>
//       Scaffold(
//         body: ChangeNotifierProvider(
//           create: (context) => GoogleSignInProvider(),
//           child: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               final provider = Provider.of<GoogleSignInProvider>(context);
//
//               if (provider.isSigningIn) {
//                 return buildLoading();
//               } else if (snapshot.hasData) {
//                 return LoggedInWidget();
//               } else {
//                 return LoginPage();
//               }
//             },
//           ),
//         ),
//       );
//
//   Widget buildLoading() =>
//       Stack(
//         fit: StackFit.expand,
//         children: [
//
//           Center(child: CircularProgressIndicator()),
//         ],
//       );
// }