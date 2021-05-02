import 'package:flutter/material.dart';
import 'package:socialfoody/pages/HomePage.dart';
import 'package:socialfoody/widgets/HeaderWidget.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';
import 'package:socialfoody/widgets/PostWidget.dart';

class PostScreenPage extends StatelessWidget {

  final String userId;
  final String postId;

  PostScreenPage({
    this.userId,
    this.postId,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsReference.document(userId).collection("userPosts").document(postId).get(),
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData)
        {
          return circularProgress();
        }

        Post post = Post.fromDocument(dataSnapshot.data);
        return Center(
          child: Scaffold(
            appBar: header(context, strTitle:  post.description),
            body: ListView(
              children: [
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
