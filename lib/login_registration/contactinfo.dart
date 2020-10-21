import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/login_registration/upload_photo.dart';
class ContactInfo extends StatefulWidget{
  String fname,lname,dob,dob_place,maritalstatus,gender,m_month,m_year,message;
  ContactInfo({this.fname,this.lname,this.dob,this.dob_place,this.maritalstatus,this.gender,this.m_month,this.m_year,this.message});

  @override
  _ContactInfo createState() => _ContactInfo();
}
class _ContactInfo extends State<ContactInfo>{
  String partner="bride";

  TextEditingController mobileno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(

      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text("Great! Wasn't that easy?", textAlign: TextAlign.center,),
          titleTextStyle: TextStyle(
            color: MyColors.pinkvariaance,
            fontSize: 20,
            fontFamily: "Philosopher",

          ),
          content: Text("So you are a " + widget.maritalstatus + " " + widget.gender + " looking to get married by " + widget.m_month + " " + widget.m_year + "\n Let's search a suitable " + partner + " for you\n",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2, left: MediaQuery.of(context).size.width * 0.2),
              child: FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                  _UserRegistation();
                },
                child: Text("Begin Start",
                  style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 17
                  ),
                ),
                color: Dcolor.appPrimaryColor,
              ),
            )
          ],
          scrollable: true,
          // contentPadding: EdgeInsets.all(10.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        );
      },
    );
  }

  @override

  Widget build(BuildContext context) {
    print(widget.fname+" "+widget.lname+" "+widget.dob+" "+widget.dob_place+"\n"+widget.maritalstatus+" "+widget.gender+" "+widget.m_month+widget.m_year+" "+widget.message+"\n");

    (widget.gender == 'Male' || widget.gender == 'male') ? partner ="bride" : partner = "";
    (widget.gender == 'Female' || widget.gender == 'female') ? partner ="groom" : partner = "";
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Appbar_Top(),
              Positioned(
                top: 60,
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text("Almost done! Just a bit more info",
                            style: TextStyle(
                                fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.1,
                                child: TextField(
                                  readOnly: true,

                                  decoration: InputDecoration(
                                    hintText: "+91",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: size.width * 0.7,
                                child: TextField(
                                  controller: mobileno,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "My phone number is",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "My E-mail address is",
                                    hintStyle: TextStyle(
                                      color: MyColors.grayText,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: "I choose my password to be",
                                    hintStyle: TextStyle(
                                      color: MyColors.grayText,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: FlatButton(
                                  onPressed: (){
                                    _registration();
                                  },
                                  child: Text("Continue",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 17
                                    ),
                                  ),
                                  color: MyColors.pinkvariaance,
                                ),
                              ),
                            ],
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
    if (mobileno.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Mobile",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        timeInSecForIosWeb: 1,);
    } else if (email.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (password.text== "") {
      Fluttertoast.showToast(
          msg: "Please enter Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }else if (mobileno.text.length != 10) {
      Fluttertoast.showToast(
          msg: "Please enter 10 digit Phone Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else {
      _showMyDialog();
    }
  }

  showMsg(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(Strings.title),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Dcolor.appPrimaryColor),
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

  _UserRegistation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UploadPhoto(
              fname: widget.fname,
              lname: widget.lname,
              dob: widget.dob,
              dob_place: widget.dob_place,
              maritalstatus: widget.maritalstatus,
              gender: widget.gender,
              m_month: widget.m_month,
              m_year: widget.m_year,
              mobileno: mobileno.text,
              email: email.text,
              password: password.text,
            )));
  }


}