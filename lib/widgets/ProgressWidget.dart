import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12.0),
    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black38),),
  );
}

linearProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12.0),
    child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black38),),
  );
}
