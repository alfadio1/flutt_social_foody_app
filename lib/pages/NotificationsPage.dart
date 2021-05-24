import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfoody/pages/HomePage.dart';
import 'package:socialfoody/pages/PostScreenPage.dart';
import 'package:socialfoody/pages/ProfilePage.dart';
import 'package:socialfoody/widgets/HeaderWidget.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';
import 'package:timeago/timeago.dart' as tAgo;

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: "Notifications", ),
      body: Container(
        child: FutureBuilder(
          future: retrieveNotifications(),
          builder: (context, dataSnapshot)
          {
            if (!dataSnapshot.hasData) {
              return circularProgress();
            }
            return ListView(children: dataSnapshot.data,);
          },
        ),
      ),
    );
  }

  retrieveNotifications() async{
    QuerySnapshot querySnapshot = await activityFeedReference.document(currentUser.id)
        .collection("feedItems").orderBy("timestamp", descending: true)
        .limit(60).getDocuments();

    List<NotificationsItem> notificationItems = [];

    querySnapshot.documents.forEach((document) {
      notificationItems.add(NotificationsItem.fromDocument(document));
    });
    return notificationItems;
  }
}

String notificationItemText;
Widget mediaPreview;

class NotificationsItem extends StatelessWidget {
  final String username;
  final String type;
  final String commentData;
  final String postId;
  final String userId;
  final String userProfileImg;
  final String url;
  final Timestamp timestamp;

  NotificationsItem({
    this.username, this.type, this.commentData, this.postId, this.userId, this.userProfileImg, this.url, this.timestamp
});
  factory NotificationsItem.fromDocument(DocumentSnapshot documentSnapshot){
    return NotificationsItem(
      username: documentSnapshot["username"],
      type: documentSnapshot["type"],
      commentData: documentSnapshot["commentData"],
      postId: documentSnapshot["postId"],
      userId: documentSnapshot["userId"],
      userProfileImg: documentSnapshot["userProfileImg"],
      url: documentSnapshot["url"],
      timestamp: documentSnapshot["timestamp"],
    );
  }

  @override
  Widget build(BuildContext context) {

    configureMediaPreview(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Container(
        color: Colors.white54,
        child: ListTile(
          title: GestureDetector(
            onTap: ()=> displayUserProfile(context, userProfileId: userId),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                children: [
                  TextSpan(text: username, style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '$notificationItemText'),
                ],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(userProfileImg),
          ),
          subtitle: Text(tAgo.format(timestamp.toDate()), overflow: TextOverflow.ellipsis,),
          trailing: mediaPreview,
        ),
      ),
    );

  }

  configureMediaPreview(context){
    if(type == "comment" || type == "like")
    {
      mediaPreview = GestureDetector(
        onTap: () => displayFullPost(context),
        child: Container(
          height: 50.0,
          width: 50.0,
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(url)),
              ),
            ),
          ),
        ),
      );
    }
    else
    {
      mediaPreview = Text("");
    }
    
    if (type == "like") {
      notificationItemText = "liked your post.";
    }

    else if (type == "new comment") {
      notificationItemText = "replied: $commentData";
    }

    else if (type == "follow") {
      notificationItemText = "is following you";
    }
    else
    {
      notificationItemText = "Error, = $type";
    }
  }


  displayFullPost(context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> PostScreenPage(postId: postId, userId: userId,)));
  }

  displayUserProfile(BuildContext context, {String userProfileId}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage(userProfileId: userProfileId,)));
  }

}
