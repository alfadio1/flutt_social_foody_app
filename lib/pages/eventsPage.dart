// import 'package:flutter/material.dart';
//
//
// class EventPage extends StatelessWidget {
//   const EventPage({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(10),
//       height: 50,
//       //alignment: Alignment.topLeft,
//       decoration: BoxDecoration(
//         color: Colors.lightBlueAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text("Events",
//         style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//
//       ),
//     );
//
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socialfoody/widgets/HeaderWidget.dart';
import 'package:http/http.dart' as http;

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    
    for(var u in jsonData){
      User user = User(u["name"], u["email"], u["userName"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: "Events", ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, i){
                return ListTile(
                  title: Text(snapshot.data[i].name != null ? snapshot.data[i].name:''),
                  subtitle: Text(snapshot.data[i].userName != null ? snapshot.data[i].userName:''),
                  trailing: Text(snapshot.data[i].email != null ? snapshot.data[i].email:''),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}

class User {

  final String name, email, userName;

  User(this.name, this.email, this.userName);
}
// class NotificationsItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
