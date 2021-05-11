import 'package:flutter/material.dart';
class BlockedListScreen extends StatefulWidget {
  @override
  _BlockedListScreenState createState() => _BlockedListScreenState();
}

class _BlockedListScreenState extends State<BlockedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blocked List"),
      ),
      body: TextField(
        decoration: InputDecoration(
          hintText: 'Search.....',
          hintStyle: TextStyle(
              color: Colors.blueGrey
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}