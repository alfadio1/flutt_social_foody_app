import 'package:flutter/material.dart';
import 'package:socialfoody/pages/trial.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);
  // TextEditingController searchTextEditingController = TextEditingController();
  // Future<QuerySnapshot> futureSearchResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      height: 50,
      //alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchFieldd()));
        },
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: 9.0,
            ),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(25.0),
              ),
            ),
            // border: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            hintText: "Search food",
            prefixIcon: Icon(Icons.search)
        ),
      ),

    );
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result here.");
  }
}


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:socialfoody/models/user.dart';
// import 'package:socialfoody/pages/HomePage.dart';
// import 'package:socialfoody/pages/ProfilePage.dart';
// import 'package:socialfoody/widgets/ProgressWidget.dart';
// import 'package:socialfoody/pages/No_user.dart';

// class SearchField extends StatefulWidget {
//   @override
//   _SearchFieldState createState() => _SearchFieldState();
// }
//
//
// class _SearchFieldState extends State<SearchField> with AutomaticKeepAliveClientMixin<SearchField>
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
//
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
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: futureSearchResults == null ? ListUsersPage() : displayUsersFoundScreen(),
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