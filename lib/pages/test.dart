// createSecondProfileView(){
//   return Container(
//     alignment: Alignment.center,
//     child: Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             createColumns("Catalogue", 0),
//             createColumns("Followers", 0),
//             createColumns("Following", 0),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             createButton(),
//           ],
//
//         )],
//     ),
//   );
// }
//
// return Center(
// child: SizedBox(
// height: 75,
// width: 75,
// child: Stack(
//
// fit: StackFit.expand,
// overflow: Overflow.visible,
// children: [
// CircleAvatar(
// backgroundImage: CachedNetworkImageProvider(user.url),
//
// ),
// Positioned(
// right: -16,
// bottom: 0,
// child: SizedBox(
// height: 46,
// width: 46,
// child: FlatButton(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50),
// side: BorderSide(color: Colors.white),
// ),
// color: Color(0xFFF5F6F9),
// onPressed: () {},
// child: Icon(Icons.camera_alt_outlined),
// ),
// ),
// ),
//
//
// ]
// )
// ),
//
// );

////searchfield
// import 'package:socialfoody/models/user.dart';
// import 'package:socialfoody/pages/HomePage.dart';
// import 'package:socialfoody/widgets/ProgressWidget.dart';


// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage>
// {
//   TextEditingController searchTextEditingController = TextEditingController();
//   Future<QuerySnapshot> futureSearchResults;
//
//   emptyTheTextFormfield(){
//     searchTextEditingController.clear();
//   }
//   controlSearching(String str){
//     Future<QuerySnapshot> allUsers = usersReference.where("profileName", isGreaterThanOrEqualTo: str).getDocuments();
//     setState(() {
//       futureSearchResults = allUsers;
//
//     });
//   }
//
//   AppBar searchPageHeader(){
//     return AppBar(
//       backgroundColor: Colors.black38,
//       title: TextFormField(
//         style: TextStyle(fontSize: 18.0, color: Colors.white),
//         controller: searchTextEditingController,
//         decoration: InputDecoration(
//           hintText: "Search food",
//           hintStyle: TextStyle(color: Colors.grey),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           filled: true,
//           prefixIcon: Icon(Icons.person_pin, color: Colors.white, size: 30.0,),
//           suffixIcon: IconButton(icon: Icon(Icons.clear, color: Colors.white,), onPressed: emptyTheTextFormfield,),
//         ),
//         onFieldSubmitted: controlSearching ,
//       ),
//     );
//
//   }
//
//   Container displayNoSearchResultScreen(){
//     // final Orientation orientation = MediaQuery.of(context).orientation;
//     return Container(
//       child: ListView(
//         shrinkWrap: true,
//         children: <Widget>[
//           Icon(Icons.group, color: Colors.grey, size: 200.0,),
//           Text(
//             "Search Users",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 65.0),
//           ),
//         ],
//       ),
//     );
//   }
//
//   displayUsersFoundScreen(){
//     return FutureBuilder(
//       future: futureSearchResults,
//       builder: (context, dataSnapshot)
//       {
//         if(!dataSnapshot.hasData)
//         {
//           return circularProgress();
//         }
//         List<UserResult> searchUsersResult = [];
//         dataSnapshot.data.documents.forEach((document)
//         {
//           User eachUser = User.fromDocument(document);
//           UserResult userResult = UserResult(eachUser);
//           searchUsersResult.add(userResult);
//         });
//         return ListView(children: searchUsersResult);
//       },
//     );
//
//   }
//
//   bool get wantKeepAlive =>true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black38,
//       appBar: searchPageHeader(),
//       body: futureSearchResults == null ?  displayNoSearchResultScreen() : displayUsersFoundScreen(),
//     );
//   }
// }
//
// class UserResult extends StatelessWidget {
//   final User eachUser;
//   UserResult(this.eachUser);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(3.0),
//       child: Container(
//         color: Colors.white54,
//         child: Column(
//           children: <Widget>[
//             GestureDetector(
//               onTap: ()=> print("tapped"),
//               child: ListTile(
//                 leading: CircleAvatar(backgroundColor: Colors.black,backgroundImage: CachedNetworkImageProvider(eachUser.url),),
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
//
//       ),
//     );
//   }
// }



// Expanded(
//     child: IconBtnWithCounter(
//       icon: Icons.video_call_outlined,
//       press: () {},
//     ),),
//
// Expanded(
//     child:
//     IconBtnWithCounter(
//       icon: Icons.add_to_photos,
//
//       press: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => UploadPage()));
//       },
//     ),
// ),


/////////eventbutton
// return Container(
// height: 60,
// width: MediaQuery.of(context).size.width,
// // margin: EdgeInsets.all(150),
// padding: EdgeInsets.symmetric(
// horizontal: 20,
// vertical: 15,
// ),
// decoration: BoxDecoration(
// color: Color(0xFF4A3298),
// borderRadius: BorderRadius.circular(20),
// ),
// child: Text("Events",
// style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//
// ),
// );


// if (numOfitem != 0)
// Positioned(
//   top: -3,
//   right: 0.5,
//   child: Container(
//     height: (16),
//     width: (16),
//     decoration: BoxDecoration(
//       color: Color(0xFFFF4848),
//       shape: BoxShape.circle,
//       border: Border.all(width: 1.5, color: Colors.white),
//     ),
//     child: Center(
//       child: Text(
//         "Alpha ",
//         style: TextStyle(
//           fontSize: (10),
//           height: 1,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   ),
// )



////////SEARCHPAGETESTCODE
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:socialfoody/models/user.dart';
// import 'package:socialfoody/pages/HomePage.dart';
// import 'package:socialfoody/widgets/ProgressWidget.dart';
//
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
//   bool get wantKeepAlive => true;
//
//   @override
//   Widget build(BuildContext) {
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
//               onTap: () => print("tapped"),
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
// }