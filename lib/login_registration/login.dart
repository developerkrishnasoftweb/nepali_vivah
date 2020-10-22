// import 'dart:html';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/constant/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
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
              width: size.width * 0.9,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: size.width * 0.9,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                style: TextStyle(),
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
                        style:
                        TextStyle(color: MyColors.whiteColor, fontSize: 17),
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
    );
  }
  void login() {
    print(email.text + password.text);
    if (email.text != "" && password.text != "") {
      FormData formData = FormData.fromMap({
        "email" : email.text,
        "pass" : password.text
      });
      Services.userSignIn(formData).then((value) {
        print(value.response);
        if(value.response == "1"){
          Fluttertoast.showToast(
            msg: "Login successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MyColors.blackText,
            textColor: MyColors.whiteColor,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        } else {
          Fluttertoast.showToast(
            msg: "Something went wrong !!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MyColors.blackText,
            textColor: MyColors.whiteColor,
            timeInSecForIosWeb: 1,
            fontSize: 16,
          );
        }
      });
    } else {
      Fluttertoast.showToast(
        msg: "please enter your email or password",
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
