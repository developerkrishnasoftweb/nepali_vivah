import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_vivah/login_registration/username.dart';

class UploadPhoto extends StatefulWidget {
  String fname,
      lname,
      dob,
      dob_place,
      maritalstatus,
      gender,
      m_month,
      m_year,
      mobileno,
      email,
      password;

  UploadPhoto(
      {this.fname,
      this.lname,
      this.dob,
      this.dob_place,
      this.maritalstatus,
      this.gender,
      this.m_month,
      this.m_year,
      this.mobileno,
      this.email,
      this.password});

  @override
  _UploadPhoto createState() => _UploadPhoto();
}

class _UploadPhoto extends State<UploadPhoto> {
  final picker = ImagePicker();
  Future<File> _AadhaarImage;
  Future<File> _ProfileImage;
  File _profile_image;
  File _Adhar_image;
  String Adharbase64Image;
  String Profilebase64Image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: MyColors.whiteColor,
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Appbar_Top(),
              Positioned(
                top: 60,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text(
                            "Welcome to nepalivivah!\n Let's help you with next steps.",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Aaditya Pankaj",
                                style: TextStyle(
                                    color: MyColors.pinkvariaance,
                                    fontSize: 20),
                              ),
                              Container(
                                  width: size.width * 0.85,
                                  child: Text(
                                    "(Please upload your beautiful photos  now Remember, no one wants to show an interest in your profile if you don't have photos.)",
                                    style: TextStyle(
                                        fontSize: 15, color: MyColors.grayText),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: size.width * 0.85,
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: showProfileImage(),
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _ProfileImage =  ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 250,maxHeight: 250);
                                    });
                                  },
                                  color: MyColors.pinkvariaance,
                                  child: Text(
                                    "Upload Profile",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: size.width * 0.9,
                                height: 40,
                                alignment: Alignment(-1.0, 0.0),
                                child: Text(
                                  "Adhaar card photo",
                                  style: TextStyle(
                                      fontSize: 17, color: MyColors.grayText),
                                ),
                              ),
                              Container(
                                  width: size.width * 0.85,
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: showAdharImage(),
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      _AadhaarImage =  ImagePicker.pickImage(source: ImageSource.gallery,maxWidth: 250,maxHeight: 250);
                                    });
                                  },
                                  color: MyColors.pinkvariaance,
                                  child: Text(
                                    "Upload Adhar",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 20),
                                  ),
                                ),
                              ),

                              Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.04),
                                width: size.width * 0.9,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    _registration();
                                  },
                                  color: MyColors.pinkvariaance,
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _registration() {
    if (_profile_image == null) {
      Fluttertoast.showToast(
        msg: "Please Select Profile Image",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        timeInSecForIosWeb: 1,
      );
    } else if (_AadhaarImage == null) {
      Fluttertoast.showToast(
          msg: "Please Select Aadhaar Image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else {
      _UserRegistation();
    }
  }

  _UserRegistation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Username(
                  fname: widget.fname,
                  lname: widget.lname,
                  dob: widget.dob,
                  dob_place: widget.dob_place,
                  maritalstatus: widget.maritalstatus,
                  gender: widget.gender,
                  mobileno: widget.mobileno,
                  email: widget.email,
                  password: widget.password,
                  profileimage: _profile_image,
                  adharimage: _Adhar_image,
                  profilebaseimage: Profilebase64Image,
                  aadharbaseimage: Adharbase64Image,
                )));
  }

  Widget showAdharImage() {
    return FutureBuilder<File>(
      future: _AadhaarImage,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          _Adhar_image = snapshot.data;
          Adharbase64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              // fit: BoxFit.contain,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Image(
            height: 80,
            image: AssetImage(
                "assets/images/adhar.jpg"),
            fit: BoxFit.fitHeight,
          );
        }
      },
    );
  }
  Widget showProfileImage() {
    return FutureBuilder<File>(
      future: _ProfileImage,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          _profile_image = snapshot.data;
          Profilebase64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              // fit: BoxFit.contain,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Image(
            height: 80,
            image: AssetImage(
                "assets/images/user.png"),
            fit: BoxFit.fitHeight,
          );
        }
      },
    );
  }
}
