// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:socialfoody/models/user.dart';
// import 'package:socialfoody/pages/HomePage.dart';
// import 'package:socialfoody/pages/ProfilePage.dart';
// import 'package:socialfoody/widgets/ProgressWidget.dart';
//
//
// class SearchFieldd extends StatefulWidget {
//   @override
//   _SearchFielddState createState() => _SearchFielddState();
// }
//
//
// class _SearchFielddState extends State<SearchFieldd> with AutomaticKeepAliveClientMixin<SearchFieldd>
// {
//
//   // const SearchField({
//   //   Key key,
//   // }) : super(key: key);
//   TextEditingController searchTextEditingController = TextEditingController();
//   Future<QuerySnapshot> futureSearchResults;
//
//   emptyTheTextForm(){
//     searchTextEditingController.clear();
//   }
//
//   controlSearching(String str){
//     Future<QuerySnapshot> allUsers = usersReference.where("profileName", isGreaterThanOrEqualTo: str).getDocuments();
//     setState(() {
//       futureSearchResults = allUsers;
//     });
//   }
//
//   @override
//   Widget searchField() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(10),
//       height: 50,
//       //alignment: Alignment.topLeft,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: TextFormField(
//         onChanged: (value) => print(value),
//         controller: searchTextEditingController,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 2.0,
//             vertical: 9.0,
//           ),
//           border: new OutlineInputBorder(
//             borderRadius: const BorderRadius.all(
//               const Radius.circular(25.0),
//             ),
//           ),
//           // border: InputBorder.none,
//           // focusedBorder: InputBorder.none,
//           // enabledBorder: InputBorder.none,
//           hintText: "Search food",
//           prefixIcon: Icon(Icons.search),
//           suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: emptyTheTextForm(),),
//         ),
//         onFieldSubmitted: controlSearching,
//       ),
//
//     );
//   }
//
//   Container displayNoSearchResultScreen(){
//     final Orientation orientation = MediaQuery.of(context).orientation;
//     return Container(
//       child: Center(
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             Icon(Icons.group, color: Colors.black, size: 200.0,),
//             Text(
//               "Search Users",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 65.0),
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   displayUsersFoundScreen(){
//     return FutureBuilder(
//       future: futureSearchResults,
//       builder: (context, dataSnapshot){
//         if(!dataSnapshot.hasData){
//           return circularProgress();
//         }
//
//         List<UserResult> searchUserResult = [];
//         dataSnapshot.data.documents.forEach((document){
//           User eachUser = User.fromDocument(document);
//           UserResult userResult = UserResult(eachUser);
//           searchUserResult.add(userResult);
//         });
//
//         return ListView(children: searchUserResult);
//       },
//     );
//   }
//
//
// }
//
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: futureSearchResults == null ? displayNoSearchResultScreen() : displayUsersFoundScreen(),
//     );
//   }
// }
//
//
//
// class UserResult extends StatelessWidget {
//   final User eachUser;
//   UserResult(this.eachUser);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(3.0),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () => displayUserProfile(context, userProfileId: eachUser.id),
//               child: ListTile(
//                 leading: CircleAvatar(backgroundColor: Colors.black, backgroundImage: CachedNetworkImageProvider(eachUser.url),),
//                 title: Text(eachUser.profileName, style: TextStyle(
//                   color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold,
//                 ),),
//                 subtitle: Text(eachUser.username, style: TextStyle(
//                   color: Colors.black, fontSize: 13.0,
//                 ),),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   displayUserProfile(BuildContext context, {String userProfileId}){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfoody/models/user.dart';
import 'package:socialfoody/pages/HomePage.dart';
import 'package:socialfoody/pages/ProfilePage.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';


class SearchFieldd extends StatefulWidget {
  @override
  _SearchFielddState createState() => _SearchFielddState();
}


class _SearchFielddState extends State<SearchFieldd> with AutomaticKeepAliveClientMixin<SearchFieldd>
{

  // const SearchField({
  //   Key key,
  // }) : super(key: key);
  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults;

  emptyTheTextForm(){
    searchTextEditingController.clear();
  }

  controlSearching(String str){
    Future<QuerySnapshot> allUsers = usersReference.where("profileName", isGreaterThanOrEqualTo: str).getDocuments();
    setState(() {
      futureSearchResults = allUsers;
    });
  }

  // @override
  // Widget header() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     padding: EdgeInsets.all(10),
  //     height: 50,
  //     //alignment: Alignment.topLeft,
  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: TextFormField(
  //
  //       // onChanged: (value) => print(value),
  //       controller: searchTextEditingController,
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(
  //           horizontal: 2.0,
  //           vertical: 9.0,
  //         ),
  //         border: new OutlineInputBorder(
  //           borderRadius: const BorderRadius.all(
  //             const Radius.circular(25.0),
  //           ),
  //         ),
  //         // border: InputBorder.none,
  //         // focusedBorder: InputBorder.none,
  //         // enabledBorder: InputBorder.none,
  //         hintText: "Search food",
  //         prefixIcon: Icon(Icons.search),
  //         suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: emptyTheTextForm(),),
  //       ),
  //       onFieldSubmitted: controlSearching,
  //     ),
  //
  //   );
  // }
  AppBar searchPageHeader(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.lightBlueAccent,
      title: TextFormField(
        style: TextStyle(fontSize: 18.0, color: Colors.white),
        controller: searchTextEditingController,
        decoration: InputDecoration(
            hintText: "Search here...",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            prefixIcon: Icon(Icons.person_pin, color: Colors.white, size: 30.0,),
            suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.white,),onPressed: emptyTheTextForm(),)
        ),
        onFieldSubmitted: controlSearching,
      ),
    );
  }

  Container displayNoSearchResultScreen(){
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Icon(Icons.group, color: Colors.black, size: 100.0,),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 35.0),

            )
          ],
        ),
      ),
    );
  }

  displayUsersFoundScreen(){
    return FutureBuilder(
      future: futureSearchResults,
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData){
          return circularProgress();
        }

        List<UserResult> searchUserResult = [];
        dataSnapshot.data.documents.forEach((document){
          User eachUser = User.fromDocument(document);
          UserResult userResult = UserResult(eachUser);
          searchUserResult.add(userResult);
        });

        return ListView(children: searchUserResult);
      },
    );
  }


  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: searchPageHeader(),
      body: futureSearchResults == null ? displayNoSearchResultScreen() : displayUsersFoundScreen(),
    );
  }


}

class UserResult extends StatelessWidget {
  final User eachUser;
  UserResult(this.eachUser);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => displayUserProfile(context, userProfileId: eachUser.id),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.black, backgroundImage: CachedNetworkImageProvider(eachUser.url),),
                title: Text(eachUser.profileName, style: TextStyle(
                  color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold,
                ),),
                subtitle: Text(eachUser.username, style: TextStyle(
                  color: Colors.black, fontSize: 13.0,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }


  displayUserProfile(BuildContext context, {String userProfileId}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(userProfileId: userProfileId,)));
  }
}