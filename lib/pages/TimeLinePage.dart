import 'package:flutter/material.dart';
import 'package:socialfoody/pages/features_banner.dart';
import 'package:socialfoody/pages/feed_header.dart';
import 'package:socialfoody/widgets/HeaderWidget.dart';
import 'package:socialfoody/widgets/ProgressWidget.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            header(context, isAppTitle: true,),
            HomeHeader(),
            FeatureBanner(),
          ],
        ),
      ),
    );
  }
}
