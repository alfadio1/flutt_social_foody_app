import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:socialfoody/models/user.dart';
class UploadPage extends StatefulWidget {
  final User gCurrentUser;
  UploadPage({this.gCurrentUser});
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  File file;
  bool uploading = false;
  // String postId = Uuid().v4();
  TextEditingController descriptionTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();

  captureImageWithCamera() async{
    Navigator.pop(context);
    File imagefile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 680,
      maxWidth: 970,
    );
    setState(() {
      this.file = imagefile;

    });
  }

  pickImageFromGallery() async{
    Navigator.pop(context);
    File imagefile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.file = imagefile;

    });
  }


  takeImage(mContext){
    return showDialog(
      context: mContext,
      builder: (context){
        return SimpleDialog(
          title: Text("New Post", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Choose Image from camera", style: TextStyle(color: Colors.white),),
              onPressed:captureImageWithCamera() ,
            ),
            SimpleDialogOption(
              child: Text("Choose Image from Gallery", style: TextStyle(color: Colors.white),),
              onPressed:pickImageFromGallery() ,
            ),
            SimpleDialogOption(
              child: Text("Cancel", style: TextStyle(color: Colors.white),
        ),
              onPressed: ()=> Navigator.pop(context),
            ),

          ],
        );
      }
    );

  }

  displayUploadScreen(){
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.add_photo_alternate, color: Colors.grey,size: 200.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0),),
              child: Text("upload Image", style: TextStyle(color: Colors.white54, fontSize: 20.0),
              ),
              color: Colors.green,
              onPressed: ()=> takeImage(context)
            ),
            ),

        ],
      ),
    );
  }

  removeImage(){
    setState(() {
      file = null;
    });
  }

  getUerCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placeMarks = await Geolocator().placemarkFromCoordinates(position.altitude, position.longitude);
    Placemark mPlaceMark = placeMarks[0];
    String completeAddressInfo = '${mPlaceMark.subThoroughfare} ${mPlaceMark.thoroughfare}, ${mPlaceMark.subLocality} ${mPlaceMark.locality}, ${mPlaceMark.subAdministrativeArea} ${mPlaceMark.administrativeArea}, ${mPlaceMark.postalCode} ${mPlaceMark.country},';
    String specificAddress = ' ${mPlaceMark.locality},  ${mPlaceMark.country},';
    locationTextEditingController.text = specificAddress;
  }

  displayUploadFormScreen(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: removeImage),
        title: Text("New Post", style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          FlatButton(
        onPressed: ()=> print("tapped"),
        child: Text("Share",style: TextStyle(color: Colors.lightGreenAccent, fontWeight: FontWeight.bold, fontSize: 16.0),),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(file), fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          ListTile(
            leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(widget.gCurrentUser.url),),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "say Something about your picture",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_pin, color: Colors.white,size: 36.0,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: locationTextEditingController,
                decoration: InputDecoration(
                  hintText: "write the location",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 220.0,
            height: 110.0,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
              color: Colors.black,
              icon: Icon(Icons.location_on_outlined, color: Colors.white,),
              label: Text("Get my Location", style: TextStyle(color: Colors.white),),
              onPressed: getUerCurrentLocation(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? displayUploadScreen() : displayUploadFormScreen();
  }
}
