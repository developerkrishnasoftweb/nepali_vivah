import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/username.dart';

class UploadPhoto extends StatefulWidget {
  final String maritalstatus,
      gender,
      m_month,
      m_year,
      town,
      firstname,
      laastname,
      dob,
      dob_place,
      mobileno,
      email,
      password;

  UploadPhoto(
      {this.maritalstatus,
      this.gender,
      this.m_month,
      this.m_year,
      this.town,
      this.firstname,
      this.laastname,
      this.dob,
      this.dob_place,
      this.mobileno,
      this.email,
      this.password});

  @override
  _UploadPhoto createState() => _UploadPhoto();
}

class _UploadPhoto extends State<UploadPhoto> {
  var proImage, adhaImage;
  File _profile;
  File _Aadhar;

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
                                  child: GestureDetector(
                                    onTap: () async {
                                      proImage = await ImagePicker.pickImage(
                                          source: ImageSource.gallery,maxHeight: 250,maxWidth: 250);
                                      setState(() {
                                        _profile = proImage;
                                      });
                                    },
                                    child: _profile == null
                                        ? Image(
                                            height: size.height * 0.13,
                                            image: AssetImage(
                                                "assets/images/user.png"),
                                            fit: BoxFit.fitHeight,
                                          )
                                        : Image.file(_profile),
                                  )),
                              Container(
                                width: size.width * 0.9,
                                height: 40,
                                child: Text(
                                  "Profile Pic",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17, color: MyColors.grayText),
                                ),
                              ),
                              Container(
                                width: size.width * 0.85,
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    adhaImage = await ImagePicker.pickImage(
                                        source: ImageSource.gallery,maxHeight: 250,maxWidth: 250);
                                    setState(() {
                                      _Aadhar = adhaImage;
                                    });
                                  },
                                  child: _Aadhar == null
                                      ? Image(
                                    height: size.height * 0.13,
                                    image: AssetImage(
                                        "assets/images/adhar.jpg"),
                                    fit: BoxFit.fitHeight,
                                  )
                                      : Image.file(_Aadhar),
                                )
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 40,
                                child: Text(
                                  "Aadhaar Pic",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17, color: MyColors.grayText),
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 50,
                                margin: EdgeInsets.only(top: 15),
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
    if (_profile == "") {
      Fluttertoast.showToast(
          msg: "Please Select Profile",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (_Aadhar == "") {
      Fluttertoast.showToast(
          msg: "Please Select Aadhar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else {
      _userRegistration();
    }
  }

  _userRegistration() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Username(
      maritalstatus: widget.maritalstatus,
      gender: widget.gender,
      m_month: widget.m_month,
      m_year: widget.m_year,
      town: widget.town,
      firstname: widget.firstname,
      laastname: widget.laastname,
      dob: widget.dob,
      dob_place: widget.dob_place,
      mobileno: widget.mobileno,
      email: widget.email,
      password: widget.password,
      profileimage: _profile,
      adharimage: _Aadhar,
    )));
  }

}
