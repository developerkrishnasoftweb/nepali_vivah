import 'dart:math';

import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/mainscreens/home.dart';
import '../Api_File/services.dart';
import 'package:nepali_vivah/login_registration/partner.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Username extends StatefulWidget {
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
  File profileimage, adharimage;

  Username(
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
      this.password,
      this.profileimage,
      this.adharimage});

  @override
  _Username createState() => _Username();
}

class _Username extends State<Username> {
  ProgressDialog pr;
  var rng = Random();
  List<String> Uname = List<String>();

  @override
  void initState() {
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
  }

  @override

  TextEditingController username = TextEditingController();

  Widget build(BuildContext context) {



    var autoUsername = widget.firstname+rng.nextInt(10).toString();
    username.text = autoUsername;
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
                          child: Expanded(
                            child: Text(
                              "For easy reference of your profile, please choose a preferred username",
                              style: TextStyle(
                                fontSize: 20,
                                color: MyColors.blackText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.3,
                                    height: 50,
                                    alignment: Alignment(0.0, 0.0),
                                    child: Text(
                                      "USERNAME",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Dcolor.appDarkColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: username,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 12,
                                            left: 15,
                                            right: 0),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: size.width * 0.9,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment(1.0, 0.0),
                                child: Text(
                                  "Automatic Generated Username",
                                  style: TextStyle(
                                      color: MyColors.grayText, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "Automated Generated Username",
                            style: TextStyle(
                                fontSize: 14,
                                color: MyColors.blackText,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "The username above has been automatically generated by our system. Please type a username in the box above or choose from the suggestion whatever is easy for you to remember. If you pick 'abc' as your USERNAME, your profile can be viewed as",
                            style: TextStyle(
                              fontSize: 16,
                              color: MyColors.grayText,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          child: Text(
                            "http://www.nepalivivah.com/abc",
                            style: TextStyle(
                                fontSize: 16,
                                color: Dcolor.appGreenColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: size.width * 0.9,
                                child: Text(
                                  "Username Suggestion",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: MyColors.blackText)),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: Text(Uname[0]),
                                      groupValue: autoUsername,
                                      value: Uname[0],
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    ),
                                    Divider(
                                      color: MyColors.blackText,
                                      thickness: 1,
                                    ),
                                    RadioListTile(
                                      title: Text(Uname[1]),
                                      groupValue: autoUsername,
                                      value: Uname[1],
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    ),
                                    Divider(
                                      color: MyColors.blackText,
                                      thickness: 1,
                                    ),
                                    RadioListTile(
                                      title: Text(Uname[2]),
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                      groupValue: autoUsername,
                                      value: Uname[2],
                                    ),
                                    Divider(
                                      color: MyColors.blackText,
                                      thickness: 1,
                                    ),
                                    RadioListTile(
                                      title: Text(Uname[3]),
                                      groupValue: autoUsername,
                                      value: Uname[3],
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 20, top: 10.0),
                          child: FlatButton(
                            onPressed: () {
                              _registration();

                            },
                            color: MyColors.pinkvariaance,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: MyColors.whiteColor, fontSize: 20),
                            ),
                          ),
                        )
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
    if (username.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else{
      _userRegistration();
    }
  }

  _userRegistration() async {
    try {
      pr.show();
      String fileName = widget.profileimage.path.split('/').last;
      String fileName1 = widget.adharimage.path.split('/').last;
      print(widget.firstname +
          " " +
          widget.laastname +
          " " +
          widget.gender +
          " " +
          widget.email +
          " " +
          widget.dob +
          " " +
          widget.password +
          " " +
          widget.mobileno +
          " " +
          username.text);
      FormData d = FormData.fromMap({
        "first_name": widget.firstname,
        "last_name": widget.laastname,
        "gender": widget.gender,
        "email": widget.email,
        "date_of_birth": widget.dob,
        "password": widget.password,
        "mobile_no": widget.mobileno,
        "profile": await MultipartFile.fromFile(widget.profileimage.path,
            filename: fileName),
        "adharcard": await MultipartFile.fromFile(widget.adharimage.path,
            filename: fileName1),
        "username": username.text,
      });

      Services.MemberSignUp(d).then((value) {
        pr.hide();
        if (value.response == "1") {
          Fluttertoast.showToast(
              msg: value.message,
              backgroundColor: Colors.grey.shade100,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_SHORT);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic>route) => false);
        } else {
          showMsg("Something went wrong.");
        }
      }
      );
    } catch (e) {
      pr.hide();
      showMsg("Not access");
    }
  }

  showMsg(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Nepali Member"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
