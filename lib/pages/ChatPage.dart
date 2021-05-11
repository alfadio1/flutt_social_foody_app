import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialfoody/pages/blocked_list_screen.dart';
import 'package:socialfoody/pages/conversation_details_screen.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Conversations',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationDetailsScreen()));
                    },
                    child: Icon(
                      Icons.group_add_outlined,
                      color: Colors.white,
                      size: 30.0,

                    ),
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationDetailsScreen()));
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      )
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BlockedListScreen()));
                    },
                    child: Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 8, 1, 1),
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                        children: <Widget> [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://vcuathletics.com/images/2020/4/16//daijona_revell_wtrack_2015_16.jpg?width=300'),
                            radius: 35.0,
                          ),
                          Text('Drake',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                        ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 12),
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                        children: <Widget> [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/828659760174034944/47Z7NlWG_400x400.jpg'),
                            radius: 35.0,
                          ),
                          Text('Marco',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                        ]
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


