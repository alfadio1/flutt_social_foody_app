import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialfoody/pages/CreateAccountPage.dart';
import 'package:socialfoody/pages/NotificationsPage.dart';
import 'package:socialfoody/pages/ProfilePage.dart';

import 'package:socialfoody/pages/TimeLinePage.dart';

import 'package:socialfoody/models/user.dart';
import 'package:socialfoody/pages/chatPage.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
final usersReference = Firestore.instance.collection("users");
final StorageReference storageReference = FirebaseStorage.instance.ref().child("Posts Pictures");
final postsReference = Firestore.instance.collection("posts");
final activityFeedReference = Firestore.instance.collection("feed");
final commentsReference = Firestore.instance.collection("comments");
final followersReference = Firestore.instance.collection("followers");
final followingReference = Firestore.instance.collection("following");


final DateTime timestamp = DateTime.now();
User currentUser;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignedIn = false;
  PageController pageController;
  int getPageIndex= 0;

  void initState(){
    super.initState();
    pageController = PageController();

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
      await saveUserInfoToFireStore();
      setState(() {
        isSignedIn = true;
      });
    }
    else
    {
      isSignedIn = false;
    }

  }

  saveUserInfoToFireStore() async {
    final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
    DocumentSnapshot documentSnapshot = await usersReference.document(gCurrentUser.id).get();
    
    if(!documentSnapshot.exists){
      final username = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage() ));

      usersReference.document(gCurrentUser.id).setData({
        "id": gCurrentUser.id,
        "profileName": gCurrentUser.displayName,
        "username": username,
        "url": gCurrentUser.photoUrl,
        "email": gCurrentUser.email,
        "bio": "",
        "timestamp": timestamp,

      });
      documentSnapshot = await usersReference.document(gCurrentUser.id).get();
    }

    currentUser = User.fromDocument(documentSnapshot);


  }

  void dispose (){
    pageController.dispose();
    super.dispose();
  }

  loginUser(){
    gSignIn.signIn();

  }

  logoutUser(){
    gSignIn.signOut();
  }

  onTapChangePage(int pageIndex){
    pageController.animateToPage(pageIndex, duration: Duration(microseconds: 400), curve: Curves.bounceInOut,);
  }

  whenPageChanges(int pageIndex){
    setState(() {
      this.getPageIndex = pageIndex;
    });

  }

  Scaffold buildHomeScreen(){
    return Scaffold(
      body: PageView(
        children: <Widget>[
          TimeLinePage(
          ),

          ChatPage(),
          // SearchFieldd(),
          NotificationsPage(),
          ProfilePage(userProfileId: currentUser.id,),

        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: getPageIndex,
        onTap: onTapChangePage,
        backgroundColor: Colors.lightBlueAccent,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore)),
          BottomNavigationBarItem(icon: Icon(Icons.message_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
    // return RaisedButton.icon(onPressed: logoutUser, icon: Icon(Icons.close), label: Text("Sign Out"));
  }

  Scaffold buildSignInScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.grey, Colors.black]
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Social Foody",
              style: TextStyle(fontSize: 92.0, color: Colors.black, fontFamily: "Signatra"),

            ),
            GestureDetector(
            onTap: loginUser(),
              child: Container(
                width: 270.0,

                height: 50,
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xffc62828),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    if(isSignedIn)
    {
      return buildHomeScreen();
    }
    else
    {
      return buildSignInScreen();
    }

  }
  }

