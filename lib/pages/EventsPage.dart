import 'package:flutter/material.dart';


class EventPage extends StatelessWidget {
  const EventPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      height: 50,
      //alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("Events",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),

      ),
    );

  }
}