import 'dart:async';

import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String username;

  submitusername(){
    final form = _formKey.currentState;
    if(form.validate())
    {
      form.save();
      SnackBar snackBar = SnackBar(content:Text("Welcome "+ username));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      Timer(Duration(seconds: 4), (){
        Navigator.pop(context, username);
      });
    }
  }



  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only( top: 26.0),
            child: Center(
              child: Text("Set up Username", style: TextStyle(fontSize: 26.0),),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(17.0),
            child: Container(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  validator: (val){
                    if(val.trim().length<5 || val.isEmpty)
                    {
                      return "user is short";
                    }
                    else if(val.trim().length>15)
                    {
                    return "user is long";
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (val) => username = val,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    labelStyle: TextStyle(fontSize: 16.0),
                    hintText: "must be at least 5 characters",
                    hintStyle: TextStyle(color: Colors.grey),

                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: submitusername,
            child: Container(
              height: 55.0,
              width: 360.0,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
