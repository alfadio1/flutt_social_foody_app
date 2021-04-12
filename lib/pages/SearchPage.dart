// import 'dart:html';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);
  // TextEditingController searchTextEditingController = TextEditingController();
  // Future<QuerySnapshot> futureSearchResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      height: 50,
      //alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 9.0,
            ),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(25.0),
              ),
            ),
            // border: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            hintText: "Search food",
            prefixIcon: Icon(Icons.search)),
      ),

    );
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result here.");
  }
}