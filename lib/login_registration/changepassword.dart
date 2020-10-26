import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/login_registration/login.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}
SharedPreferences pref;
ProgressDialog pr;
TextEditingController oldpass = TextEditingController();
TextEditingController newpass = TextEditingController();
TextEditingController confrompass = TextEditingController();

class _ChangePasswordState extends State<ChangePassword> {
  bool isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    _cleartext();
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                          child: Text("Change Password",
                            style: TextStyle(
                                fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10,top: 15.0),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: oldpass,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Old password",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.85,
                                child: TextField(
                                  obscureText: true,
                                  controller: newpass,
                                  decoration: InputDecoration(
                                    hintText: "Enter New Password",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.85,
                                child: TextField(
                                  obscureText: true,
                                  controller: confrompass,
                                  decoration: InputDecoration(
                                    hintText: "Enter Conform Password",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20,top: 25.0),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: FlatButton(
                                  onPressed: (){
                                    _changepass();
                                  },
                                  child: Text("Change Password",
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

  _changepass() {
    if (oldpass.text == "") {
        Fluttertoast.showToast(
            msg: "Please enter old passsword",
            backgroundColor: Colors.black,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT);
      } else if (newpass.text == "") {
        Fluttertoast.showToast(
            msg: "Please enter new password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else if (confrompass.text== "") {
        Fluttertoast.showToast(
            msg: "Please enter conform password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else if (confrompass.text != newpass.text) {
      Fluttertoast.showToast(
          msg: "Please conform password not same..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      } else {
       _passwordChnage();
      }
  }

  _cleartext() {
    setState(() {
      oldpass.text = "";
      newpass.text = "";
      confrompass.text = "";
    });

  }
  _passwordChnage() async {

    try{
      pr.show();
      pref = await SharedPreferences.getInstance();
      FormData data = FormData.fromMap({
        "member_id" : await pref.getString("m_id"),
        "old_pass" : oldpass.text,
        "new_pass" : newpass.text,
        "confirm_pass" : confrompass.text,
      });

      Services.memberChangePassword(data).then((value) {
        if(value.response == "1"){
          setState(() {
            pref.clear();
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
        }else{
          pr.hide();
          Fluttertoast.showToast(
            msg: "Invalid Old password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MyColors.blackText,
            textColor: MyColors.whiteColor,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        }
      });

    }catch(e){
      pr.hide();
      Fluttertoast.showToast(
        msg: "Something Is wrong..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: MyColors.blackText,
        textColor: MyColors.whiteColor,
        timeInSecForIosWeb: 1,
        fontSize: 16,
      );
    }





  }
}
