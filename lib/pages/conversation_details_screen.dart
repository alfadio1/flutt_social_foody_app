import 'package:flutter/material.dart';
class ConversationDetailsScreen extends StatefulWidget {
  @override
  _ConversationDetailsScreenState createState() => _ConversationDetailsScreenState();
}

class _ConversationDetailsScreenState extends State<ConversationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Message"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              TextField(
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
            ],
          ),
        )
    );
  }
}
