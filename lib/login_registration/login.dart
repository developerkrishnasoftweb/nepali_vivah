// import 'dart:html';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/mainscreens/home.dart';
import 'package:nepali_vivah/mainscreens/main.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ProgressDialog pr;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/images.jpg"),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                height: 100,
                width: 100,
                child: Image.asset("assets/images/logoo.png"),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                width: size.width * 0.9,
                child: TextField(
                  style: TextStyle(color: MyColors.whiteColor),
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: MyColors.whiteColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: MyColors.whiteColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: EdgeInsets.only(left: 20),
                  ),
                  style: TextStyle(color: MyColors.whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        child: Text(
                      'ForgetPassword',
                      style: TextStyle(color: MyColors.whiteColor),
                    ),
                    onTap: (){
                      print("forgetPassword");
                    },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: size.width * 0.85,
                      child: FlatButton(
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: MyColors.whiteColor, fontSize: 17),
                        ),
                        color: MyColors.pinkvariaance,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    print(email.text + password.text);
    if (email.text == "" && password.text == "") {
      Fluttertoast.showToast(
        msg: "please enter your email or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: MyColors.blackText,
        textColor: MyColors.whiteColor,
        timeInSecForIosWeb: 1,
        fontSize: 16,
      );
    } else {
      _userLogin();
    }
  }

  _userLogin() {
    try {
      pr.show();
      FormData formData =
          FormData.fromMap({"email": email.text, "pass": password.text});
      Services.MemberSignIn(formData).then((value) async {
        pr.hide();
        if (value.response == "1") {
          Fluttertoast.showToast(
            msg: "Login successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MyColors.blackText,
            textColor: MyColors.whiteColor,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          await _prefs.setString("m_id", value.data[0]["member_id"]);
          await _prefs.setString("profile_Image", "http://kvms.kriishnacab.com/public/images/Profile/");
          await _prefs.setString("GalleryImage", "http://kvms.kriishnacab.com/public/images/Gallery/");
          await _prefs.setString("Aadhar_Image","http://kvms.kriishnacab.com/public/images/Adhar_CArd/" );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
              (route) => false);
        } else {
          Fluttertoast.showToast(
            msg: "Invalid username or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MyColors.blackText,
            textColor: MyColors.whiteColor,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        }
      });
    } catch (e) {
      pr.hide();
      Fluttertoast.showToast(
        msg: "Invalid username or password",
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
