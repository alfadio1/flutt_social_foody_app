import 'package:flutter/material.dart';


class BattleOfRecipePage extends StatelessWidget {
  const BattleOfRecipePage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      height: 50,
      //alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("B - O - R",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),

      ),
    );

  }
}