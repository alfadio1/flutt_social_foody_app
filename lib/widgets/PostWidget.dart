import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfoody/models/user.dart';
import 'package:socialfoody/pages/HomePage.dart';
import 'package:socialfoody/pages/ProfilePage.dart';
import 'package:socialfoody/widgets/CImageWidget.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';
import 'package:flutter/cupertino.dart';

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  // final String timestamp;
  final dynamic likes;
  final String username;
  final String description;
  final String location;
  final String url;


  Post({
    this.postId,
    this.ownerId,

    this.likes,
    this.username,
    this.description,
    this.location,
    this.url,

  });

  factory Post.fromDocument(DocumentSnapshot documentSnapshot){
    return Post(
      postId: documentSnapshot["postId"],
      ownerId: documentSnapshot["ownerId"],
      likes: documentSnapshot["likes"],
      username: documentSnapshot["username"],
      description: documentSnapshot["description"],
      location: documentSnapshot["location"],
      url: documentSnapshot["url"],

    );

  }

  int getTotalNumberOfLikes(likes){
    if(likes == null)
    {
       return 0;
    }
    int counter = 0;
    likes.values.forEach((eachValue){
      if(eachValue == true)
      {
        counter = counter +1;
      }
    });
    return counter;
  }


  @override
  _PostState createState() => _PostState(
    postId: this.postId,
    ownerId: this.ownerId,
    likes: this.likes,
    username: this.username,
    description: this.description,
    location: this.location,
    url: this.url,
    likeCount: getTotalNumberOfLikes(this.likes),
  );
}




class _PostState extends State<Post> {

  final String postId;
  final String ownerId;
  Map likes;
  final String username;
  final String description;
  final String location;
  final String url;
  int likeCount;
  bool isLiked;
  bool showHeart = false;
  final String currentOnlineUserId = currentUser?.id;


  _PostState({
  this.postId,
  this.ownerId,
  // this.timestamp,
  this.likes,
  this.username,
  this.description,
  this.location,
  this.url,
  this.likeCount,
  });

  @override
  Widget build(BuildContext context) {

    isLiked = (likes [currentOnlineUserId] == true);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          createPostHead(),
          createPostPicture(),
          createPostFooter(),
        ],
      ),
    );
  }


  createPostHead(){
    return FutureBuilder(
      future: usersReference.document(ownerId).get(),
      // ignore: missing_return
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData)
        {
          return circularProgress();
        }
        User user = User.fromDocument(dataSnapshot.data);
        bool isPostOwner = currentOnlineUserId == ownerId;
        return ListTile(
          leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(user.url),backgroundColor: Colors.grey,),
          title: GestureDetector(
            onTap: ()=> displayUserProfile(context, userProfileId: user.id),
            child: Text(
              user.username,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(location, style: TextStyle(color: Colors.black),),
          trailing: isPostOwner ? IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black,),
            onPressed: ()=> print("deleted"),
          ) : Text(""),
        );
      },
    );
  }

  displayUserProfile(BuildContext context, {String userProfileId}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(userProfileId: userProfileId,)));
  }



  removeLike(){
    bool isNotPostOwner = currentOnlineUserId != ownerId;

    if(isNotPostOwner){
      activityFeedReference.document(ownerId).collection("feedItems").document(postId).get().then((document) {
        if(document.exists)
        {
          document.reference.delete();
        }

      });
    }

  }

  addLike(){
    bool isNotPostOwner = currentOnlineUserId != ownerId;

    if(isNotPostOwner)
    {
      activityFeedReference.document(ownerId).collection("feedItems").document(postId).setData({
        "type": "like",
        "username": currentUser.username,
        "userId": currentUser.id,
        "timestamp": DateTime.now(),
        "url": url,
        "posId": postId,
        "userProfileImg": currentUser.url,
      });
    }
  }

  controlUserLikePost(){
    bool _liked = likes [currentOnlineUserId] == true;

    if(_liked)
    {
      postsReference.document(ownerId).collection("usersPosts").document(postId).updateData({"likes.$currentOnlineUserId": false});
      removeLike();

      setState(() {
        likeCount = likeCount -1;
        isLiked = false;
        likes[currentOnlineUserId] = false;
      });
    }
    else if(!_liked)
    {
      postsReference.document(ownerId).collection("usersPosts").document(postId).updateData({"likes.$currentOnlineUserId": true});

      addLike();

      setState(() {
        likeCount = likeCount + 1;
        isLiked = true;
        likes[currentOnlineUserId] = true;
        showHeart = true;
      });
      Timer(Duration(milliseconds: 800), (){
        setState(() {
          showHeart = false;
        });

      });
    }
  }

  createPostPicture(){
    return GestureDetector(
      onDoubleTap: ()=> controlUserLikePost(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(url),
          showHeart ? Icon(Icons.favorite, size: 140.0,color: Colors.pink,) : Text(""),
          // cachedNetworkImage(url),
        ],
      ),
    );
  }

  createPostFooter()
  {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 40.0, left: 20.0)),
            GestureDetector(
              onTap: ()=> controlUserLikePost(),
              child: Icon(
                // Icons.favorite, color: Colors.white,
                isLiked ? Icons.favorite : Icons.favorite_border,
                size: 28.0,
                color: Colors.pink,
              ),
            ),

            Padding(padding: EdgeInsets.only(right: 20.0)),
            GestureDetector(
              onTap: ()=> print("Show comments"),
              child: Icon(
                Icons.chat_bubble_outlined, size: 28.0, color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                "$likeCount likes",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                "$username ",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(description, style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ],
    );
  }
}
