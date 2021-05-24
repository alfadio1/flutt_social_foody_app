import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialfoody/models/user.dart';
import 'package:socialfoody/pages/HomePage.dart';
import 'package:socialfoody/widgets/HeaderWidget.dart';
import 'package:socialfoody/widgets/PostTileWidget.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';
// import 'package:socialfoody/pages/EditProfilePage.dart';
import 'package:socialfoody/widgets/PostWidget.dart';


class ProfilePage extends StatefulWidget {
  final String userProfileId;
  ProfilePage({this.userProfileId});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // Handle Indicator
  // List<T> map<T>(List list, Function handler) {
  //   List<T> result = [];
  //   for (var  i = 0; i < list.length; i++) {
  //     result.add(handler(i, list[i]));
  //   }
  //   return result;
  // }

  final String currentOnlineUserId = currentUser?.id;

  bool loading = false;
  int countPost = 0;
  List<Post> postsList = [];
  String postOrientation = "grid";
  int countTotalFollowers = 0;
  int countTotalFollowings = 0;
  bool following = false;



  // ignore: must_call_super
  void initState(){
    getAllProfilePosts();
    getAllFollowers();
    getAllFollowing();
    checkIfAlreadyFollowing();
  }

  getAllFollowing() async {
    QuerySnapshot querySnapshot = await followingReference.document(widget.userProfileId)
        .collection("userFollowing").getDocuments();
    setState(() {
      countTotalFollowings = querySnapshot.documents.length;
    });
  }

  checkIfAlreadyFollowing() async
  {
    DocumentSnapshot documentSnapshot = await followersReference.document(widget.userProfileId)
        .collection("userFollowers").document(currentOnlineUserId).get();
    setState(() {
      following = documentSnapshot.exists;
    });
  }

  getAllFollowers() async {
    QuerySnapshot querySnapshot = await followingReference.document(widget.userProfileId)
        .collection("userFollowers").getDocuments();
    setState(() {
      countTotalFollowers = querySnapshot.documents.length;
    });
  }

  createProfileTopView(){
    return FutureBuilder(
      future: usersReference.document(widget.userProfileId).get(),
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData)
        {
          return circularProgress();
        }
        User user = User.fromDocument(dataSnapshot.data);
        return Padding(
          padding: EdgeInsets.all(17.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider(user.url),

                ),


                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 13.0),
                  child: Text(
                    user.username, style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                   ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    user.profileName, style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                    user.bio, style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  elevation: 8.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                createColumns("Catalogue", countPost),
                                createColumns("Followers", countTotalFollowers),
                                createColumns("Following", countTotalFollowings),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                createButton(),
                              ],

                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }

  Column createColumns(String title, int count){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }

  createButton(){
    bool ownProfile = currentOnlineUserId == widget.userProfileId;
    if(ownProfile)
    {
      return createButtonTitleAndFunction(title:"Edit ", performFunction: editUserProfile(),);
    }
    else if(following)
    {
      return createButtonTitleAndFunction(title:"Unfollow ", performFunction: controlUnfollowUser,);
    }
    else if(!following)
    {
      return createButtonTitleAndFunction(title:"Follow ", performFunction: controlFollowUser,);
    }
  }

  controlUnfollowUser(){
    setState(() {
      following = false;
    });
    followersReference.document(widget.userProfileId)
        .collection("userFollowers")
        .document(currentOnlineUserId)
        .get()
        .then((document){
          if(document.exists)
          {
            document.reference.delete();
          }
    });
    followingReference.document(currentOnlineUserId)
        .collection("userFollowing")
        .document(widget.userProfileId)
        .get()
        .then((document){
      if(document.exists)
      {
        document.reference.delete();
      }
    });

    activityFeedReference.document(widget.userProfileId).collection("feedItems")
        .document(currentOnlineUserId).get().then((document){
          if(document.exists)
          {
            document.reference.delete();
          }
    });
  }

  controlFollowUser(){
    setState(() {
      following = true;
    });
    followersReference.document(widget.userProfileId)
    .collection("userFollowers").document(currentOnlineUserId).setData({});

    followingReference.document(currentOnlineUserId)
        .collection("userFollowing").document(widget.userProfileId).setData({});

    activityFeedReference.document(widget.userProfileId).collection("feedItems")
        .document(currentOnlineUserId).setData({
      "type": "follow",
      "ownerId": widget.userProfileId,
      "username": currentUser.username,
      "timestamp": DateTime.now(),
      "userProfileImg": currentUser.url,
      "userId": currentOnlineUserId,
    });
  }

  Container createButtonTitleAndFunction({String title, Function performFunction}){
    return Container(
      padding: EdgeInsets.only(top: 3.0),
      child: FlatButton(
        onPressed: performFunction,
        child: Container(
          width: 245.0,
          height: 26.0,
          child: Text(title, style: TextStyle(color: following ? Colors.grey : Colors.white, fontWeight: FontWeight.bold),

          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }

  editUserProfile(){
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfilePage(currentOnlineUserId: currentOnlineUserId,)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: "Profile", ),
      body: ListView(
        children: <Widget>[
          createProfileTopView(),
          // createSecondProfileView(),
          Divider(),
          //createProfileBody(),
          createListAndGridPostOrientation(),
          Divider(height: 0.0,),
          displayProfilePost(),
        ],
      ),
    );
  }

  // createProfileBody(){
  //   return Padding(
  //     padding: EdgeInsets.only(left:  16, right: 13, top: 29),
  //     child: Row(
  //       children: [
  //         Text('Operation'),
  //         Row(
  //           children:map<Widget>(datas, (index, selected) {
  //             return Container();
  //           }),
  //         )
  //       ],
  //
  //     ),
  //   );
  // }


  displayProfilePost()
  {
    if(loading)
    {
      return circularProgress();
    }
    else if(postsList.isEmpty)
    {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Icon(Icons.photo_library, color: Colors.grey, size: 200.0,),

            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Catalogue is Empty",
              style: TextStyle(color: Colors.redAccent, fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }

    else if(postOrientation == "grid")
    {
      List<GridTile> gridTilesList = [];
      postsList.forEach((eachPost){
        gridTilesList.add(GridTile(child: PostTile(eachPost)));
      });
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: gridTilesList,
      );

    }

    else if(postOrientation == "list")
    {
      return Column(
        children: postsList,
      );

    }

  }


  getAllProfilePosts() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot querySnapshot = await postsReference.document(widget.userProfileId).collection("userPosts").orderBy("timestamp", descending: true).getDocuments();

    setState(() {
      loading = false;
      countPost = querySnapshot.documents.length;
      postsList = querySnapshot.documents.map((documentSnapshot) => Post.fromDocument(documentSnapshot)).toList();

    });
  }

  createListAndGridPostOrientation(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: ()=> setOrientation("grid") ,
          icon: Icon(Icons.photo_library,),
          color: postOrientation == "grid" ? Theme.of(context).primaryColor : Colors.grey,
        ),
        IconButton(
          onPressed: ()=> setOrientation("list") ,
          icon: Icon(Icons.bookmark),
          color: postOrientation == "list" ? Theme.of(context).primaryColor : Colors.grey,
        )
      ],
    );
  }

  setOrientation(String orientation)
  {
    setState(() {
      this.postOrientation = orientation;
    });
  }
}
