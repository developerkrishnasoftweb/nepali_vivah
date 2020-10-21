import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/personalinfo.dart';
import '../Api_File/services.dart';
class Registration extends StatefulWidget{
  @override
  _Registration createState() => _Registration();
}
class _Registration extends State<Registration>{
  @override
  List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  String maritalStatus = "Choose marital status";
  String month = "May";
  String year = "2020";
  String gender = "male";
  var now = new DateTime.now();

  TextEditingController town = TextEditingController();

  Widget build(BuildContext context) {

    String month = months[now.month-1];
    String year = now.year.toString();
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
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  width: size.width,
                  color: MyColors.pinkvariaance,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.3,
                        height: 60,
                        alignment: Alignment(0.0, 0.0),
                        child: Text(string.registrationLearnMore,
                          style: TextStyle(
                            fontSize: 16,
                              color: MyColors.whiteColor,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(string.registrationTitleTop,
                                style: TextStyle(
                                  fontSize: 18,
                                    color: MyColors.whiteColor,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: size.width * 0.1),
                              child: Text(string.registrationTitleBottom,
                                style: TextStyle(
                                  fontSize: 18,
                                    color: MyColors.whiteColor,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.3,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person_outline,
                              color: MyColors.whiteColor,
                              size: 25,
                            ),
                            Text("Login",
                              style: TextStyle(
                                  color: MyColors.whiteColor,
                                fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                bottom: 50,
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.3,
                          width: size.width,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/images.jpg"),
                              fit: BoxFit.fill,
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                            ),
                          ),
                          child: Container(
                            height: size.height * 0.4,
                            width: size.width,
                            padding: EdgeInsets.only(bottom: 40),
                            alignment: Alignment(0.0, 1.0),
                            child: Text("खोज्नुहोस् जीवन साथी",
                              style: TextStyle(
                                  color: MyColors.whiteColor,
                                fontSize: 17
                              ),
                            ),
                          ),
                        ),

                        Container(

                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(string.registrationIam,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: MyColors.pinkvariaance
                                  ),
                                ),
                              ),

                              Container(

                                padding: EdgeInsets.only(left: 15, right: 5),
                                height: 40,
                                width: size.width * 0.6,
                                decoration: BoxDecoration(
                                  border: Border.all(color:MyColors.pinkvariaance),
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Dcolor.shadowColor,
                                      spreadRadius: 0.1,
                                      blurRadius: 5
                                    ),
                                  ],
                                  color: MyColors.whiteColor,
                                ),

                                child: DropdownButton(
                                  value: maritalStatus,
                                  icon: Icon(Icons.keyboard_arrow_down,color: MyColors.pinkvariaance,),
                                  iconSize: 20,

                                  elevation: 0,
                                  style: TextStyle(color: MyColors.pinkvariaance),
                                  dropdownColor: MyColors.whiteColor,
                                  onChanged: (String value) {
                                    setState(() {
                                      maritalStatus = value;
                                    });
                                  },
                                  underline: Container(color: Colors.transparent,),
                                  isExpanded: true,
                                  items: <String>['Choose marital status', 'Married', 'Unmarried', 'Widow', 'Separated'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20,),
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 60,
                                alignment: Alignment(0.0, 0.5),
                                child: Text(string.registrationIam,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: MyColors.pinkvariaance
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 5),
                                height: 60,
                                width: size.width * 0.6,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          gender = "male";
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 25,
                                            alignment: Alignment(0.0, 0.0),
                                            child: Text("Male",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                color: MyColors.blackText,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            alignment: Alignment(0.0, 0.0),
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              alignment: Alignment(0.0, 0.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Dcolor.appGreenColor),
                                                borderRadius: BorderRadius.circular(30),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Dcolor.shadowColor,
                                                      spreadRadius: 0.1,
                                                      blurRadius: 5
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: (gender == "male") ? Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Dcolor.shadowColor,
                                                        spreadRadius: 0.1,
                                                        blurRadius: 5
                                                    ),
                                                  ],
                                                  color: Dcolor.appGreenColor,
                                                ),
                                              ) : Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Dcolor.shadowColor,
                                                        spreadRadius: 0.1,
                                                        blurRadius: 5
                                                    ),
                                                  ],
                                                  color: Dcolor.appGrayColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          gender = "female";
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            //margin: EdgeInsets.only(right: 100),
                                            height: 25,
                                            alignment: Alignment(0.0, 0.0),
                                            child: Text("Female",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                color: MyColors.blackText,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            alignment: Alignment(0.0, 0.0),
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              alignment: Alignment(0.0, 0.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: MyColors.pinkvariaance),
                                                borderRadius: BorderRadius.circular(30),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Dcolor.shadowColor,
                                                      spreadRadius: 0.1,
                                                      blurRadius: 5
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: (gender == "female") ? Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Dcolor.shadowColor,
                                                        spreadRadius: 0.1,
                                                        blurRadius: 5
                                                    ),
                                                  ],
                                                  color: MyColors.pinkvariaance,
                                                ),
                                              ) : Container(
                                                height: 15,
                                                width: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Dcolor.shadowColor,
                                                        spreadRadius: 0.1,
                                                        blurRadius: 5
                                                    ),
                                                  ],
                                                  color: Dcolor.appGrayColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          padding: EdgeInsets.only(left: size.width * 0.05),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                width: size.width,
                                child: Text("Looking to get married by :- ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: MyColors.pinkvariaance,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.3,
                                      height: 40,
                                      padding: EdgeInsets.only(left: 15, right: 5),
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: MyColors.pinkvariaance),
                                          borderRadius: BorderRadius.circular(3),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Dcolor.shadowColor,
                                                spreadRadius: 0.1,
                                                blurRadius: 5
                                            ),
                                          ],
                                        color: MyColors.whiteColor,                                      ),
                                      child: DropdownButton(
                                        value: month,
                                        icon: Icon(Icons.keyboard_arrow_down,color: MyColors.pinkvariaance,),
                                        iconSize: 20,
                                        elevation: 0,
                                        style: TextStyle(color: MyColors.pinkvariaance),
                                        dropdownColor: MyColors.whiteColor,
                                        onChanged: (String value) {
                                          setState(() {
                                            month = value;
                                          });
                                        },
                                        underline: Container(color: Colors.transparent,),
                                        isExpanded: true,
                                        items: <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.3,
                                      height: 40,
                                      padding: EdgeInsets.only(left: 15, right: 5),
                                      margin: EdgeInsets.only(left: size.width * 0.05),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: MyColors.pinkvariaance),
                                          borderRadius: BorderRadius.circular(3),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Dcolor.shadowColor,
                                                spreadRadius: 0.1,
                                                blurRadius: 5
                                            ),
                                          ],
                                        color: MyColors.whiteColor,
                                      ),
                                      child: DropdownButton(
                                        value: year,
                                        icon: Icon(Icons.keyboard_arrow_down,color: MyColors.pinkvariaance,),
                                        iconSize: 20,
                                        elevation: 0,
                                        style: TextStyle(color: MyColors.pinkvariaance),
                                        dropdownColor: MyColors.whiteColor,
                                        onChanged: (String value) {
                                          setState(() {
                                            year = value;
                                          });
                                        },
                                        underline: Container(color: Colors.transparent,),
                                        isExpanded: true,
                                        items: <String>['2020', '2021', '2022', '2023', '2024', '2025'].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 30,),
                          padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                width: size.width,
                                child: Text(" I live In",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: MyColors.pinkvariaance,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: size.width * 0.9,
                                height: 50,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: MyColors.pinkvariaance),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Dcolor.shadowColor,
                                          spreadRadius: 0.1,
                                          blurRadius: 5
                                      ),
                                    ],
                                  color: MyColors.whiteColor,
                                ),
                                child: TextFormField(
                                  controller: town,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type and choose your town",
                                    hintStyle: TextStyle(
                                      color: MyColors.pinkvariaance,
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontSize: 17
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: size.width,
                  color: MyColors.pinkvariaance,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () async {
                           _registration();
                          // String id = "23";
                          // FormData formData = FormData.fromMap({
                          //   "member_id" : id
                          // });
                          // await Services.userSignIn(formData).then((value) {
                          //   print(value.response);
                          // });

                        },
                        child: Text(string.registrationButton,
                          style: TextStyle(
                            fontSize: 17,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                      Icon(Icons.blur_on,
                        color: MyColors.whiteColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _registration() {
    if (maritalStatus == "Choose marital status") {
      Fluttertoast.showToast(
          msg: "Please Choose marital ststus",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (gender == "") {
      Fluttertoast.showToast(
          msg: "Please Select Gender",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (month== "") {
      Fluttertoast.showToast(
          msg: "Please Select month",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (year == "") {
      Fluttertoast.showToast(
          msg: "Please select year ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (town.text == "") {
      Fluttertoast.showToast(
          msg: "Please Enter Live town ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }else {
      _userRegistration();
    }
  }

  _userRegistration() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetail(
      maritalstatus: maritalStatus,
      gender: gender,
      m_month: month,
      m_year: year,
      town: town.text,
    )));
  }
}