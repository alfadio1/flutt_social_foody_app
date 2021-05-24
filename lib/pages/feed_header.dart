import 'package:flutter/material.dart';

import 'package:socialfoody/pages/UploadPage.dart';
import 'package:socialfoody/pages/icon_btn_with_counter.dart';
import 'package:socialfoody/pages/SearchPage.dart';
// import 'package:socialfoody/pages/features_banner.dart';
import 'package:socialfoody/pages/HomePage.dart';
// import 'package:socialfoody/pages/trial.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(

        children: <Widget>[
          Expanded(
              child: SearchField(),
          ),
          IconBtnWithCounter(
            icon: Icons.video_call_outlined,

            press: () {
                          }
          ),
          IconBtnWithCounter(
            icon: Icons.add_to_photos, press: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPage(gCurrentUser: currentUser,)
            )
            );

          }
          ),



        ],
      ),


    );

  }
}
