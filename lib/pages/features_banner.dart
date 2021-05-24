import 'package:flutter/material.dart';
import 'package:socialfoody/pages/eventsPage.dart';
// import 'package:socialfoody/pages/eventsPage.dart';
// import 'package:socialfoody/pages/battle_of_recipePage.dart';




class FeatureBanner extends StatelessWidget {
  const FeatureBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              // padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
              color: Colors.lightBlueAccent,


              child: Text('Events',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () =>  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EventPage())),
            ),
          ),

          Expanded(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
              color: Colors.lightBlueAccent,

              child: Text('B-O-R',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () => null,
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
              color: Colors.lightBlueAccent,

              child: Text('Restaurants',
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
              onPressed: () => null,
            ),
          )
        ],
      ),

      // Row(
      //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //
      //   children: <Widget>[
      //     Expanded(
      //       child: EventPage(),
      //     ),
      //     // BattleOfRecipePage(
      //     // ),
      //     // Restaurants(
      //     // ),
      //
      //   ],
      // ),


    );
  }
}