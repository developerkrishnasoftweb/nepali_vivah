import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/login_registration/contactinfo.dart';
import 'package:nepali_vivah/login_registration/personalinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _membergetbyId();
  }

  @override
  String Status;
  SharedPreferences pref;
  String profileImage;
  String aadharImage;
  var ageStatus;
  List Userdata;
  var _index = 0;
  String M_id;
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ageStatus = Userdata[0]["marital_status_id"];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                string.titletop,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Text(
                string.titlebottom,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: MyColors.pinkvariaance,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: MyColors.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15),
                  height: 250,
                  color: MyColors.pinkvariaance,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColors.whiteColor,
                                child: Icon(
                                  Icons.insert_photo,
                                  color: MyColors.pinkvariaance,
                                ),
                                radius: 20.0,
                              ),
                              Text(
                                "Add photo",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(profileImage+Userdata[0]["profile_image"]),
                                radius: 50.0,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColors.whiteColor,
                                child: Icon(
                                  Icons.flag,
                                  color: MyColors.pinkvariaance,
                                ),
                                radius: 20.0,
                              ),
                              Text(
                                "Reports",
                                style: TextStyle(
                                  color: MyColors.whiteColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Userdata[0]["first_name"]+" "+Userdata[0]["last_name"],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: MyColors.whiteColor,
                            ),
                          ),
                          Text(
                            Userdata[0]["age"].toString()+" "+Userdata[0]["gender"]+" "+_status(ageStatus),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: MyColors.whiteColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: MyColors.whiteColor,
                              ),
                              Userdata[0]["address"] == null
                                  ? Text(
                                "--",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: MyColors.whiteColor,
                                ),
                              )
                                  :Text(
                                jsonDecode(Userdata[0]["address"])[0]["Country"].toString() + ", " + jsonDecode(Userdata[0]["address"])[0]["State"].toString()  + ", " + jsonDecode(Userdata[0]["address"])[0]["City"].toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        width: size.width,
                        color: MyColors.pinkvariaance,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: MyColors.whiteColor,
                                ),
                                Text(
                                  "Picture",
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: MyColors.whiteColor,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: MyColors.whiteColor,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: MyColors.whiteColor,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: MyColors.whiteColor,
                                ),
                                Text(
                                  "Partner info",
                                  style: TextStyle(
                                    color: MyColors.whiteColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            //width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Interested in "+ Userdata[0]["first_name"]+" "+Userdata[0]["last_name"],
                              style: TextStyle(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              "\("+Userdata[0]["interest"]+"\)",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 45,
                        width: 1,
                        color: MyColors.grayText,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            // width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              Userdata[0]["first_name"]+" "+Userdata[0]["last_name"]+" interestd in",
                              style: TextStyle(
                                color: MyColors.grayText,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, top: 5),
                            child: Text(
                                "\("+Userdata[0]["interest"]+"\)",
                              style: TextStyle(
                                color: MyColors.grayText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: MyColors.grayText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: RaisedButton(
                            onPressed: () {},
                            color: MyColors.pinkvariaance,
                            child: Icon(
                              Icons.favorite,
                              color: MyColors.whiteColor,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 20),
                          child: Text(
                            "Show Intrest",
                            style: TextStyle(color: MyColors.grayText),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: RaisedButton(
                            onPressed: () {},
                            color: MyColors.lightgreen,
                            child: Icon(
                              Icons.chat_bubble,
                              color: MyColors.whiteColor,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 20),
                          child: Text(
                            "Message",
                            style: TextStyle(color: MyColors.grayText),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: RaisedButton(
                            onPressed: () {},
                            color: MyColors.grayText,
                            child: Icon(
                              Icons.thumb_down,
                              color: MyColors.whiteColor,
                              size: 30,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 20),
                          child: Text(
                            "Dislike",
                            style: TextStyle(color: MyColors.grayText),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColors.pinkvariaance),
                  child: Text(
                    string.maintabtitle1,
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  alignment: Alignment(-0.9, 0.0),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      child: Text(Userdata[0]["introduction"],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: MyColors.grayText,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColors.pinkvariaance),
                  child: Text(
                    string.maintabtitle2,
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  alignment: Alignment(-0.9, 0.0),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Userdata[0]["gallery"].toString().split(",").length,
                    itemBuilder: (BuildContext context, int index) {
                      // print("Image Src : " + pref.getString("GalleryImage")+Userdata[0]["gallery"].toString().split(",").first);
                      print("Image Src : " + Userdata[0]["gallery"].toString().split(",")[1]);
                      return Row(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image:NetworkImage(profileImage+Userdata[0]["profile_image"]),
                                   // NetworkImage((pref.getString("GalleryImage")+Userdata[0]["gallery"].toString().split(",")[index]),)
                                ),
                          ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColors.pinkvariaance),
                  child: Text(
                    string.maintabtitle3,
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment(-0.8, 0.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Target wedding date :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "November 2015",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Name :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Nikhil Monga",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Gender :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.grayText,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "female",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Age :",
                                  style: TextStyle(
                                      color: MyColors.grayText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "28",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Height :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.grayText,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "42 (127cms)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Complextion :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Dark",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Built :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Heavy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Native Language :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Hindi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Marital Status :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Unmarried",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Location :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Nepal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Religion :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Hindu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Education :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Doctorate",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Rasidency Status :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  height: 20,
                                  width: 60,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    //elevation: 0.1,
                                    color: MyColors.pinkvariaance,
                                    child: Text(
                                      "Ask?",
                                      style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Salary :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$2000000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Proffession :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Doctor",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 25),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColors.pinkvariaance),
                  child: Text(
                    string.maintabtitle4,
                    style: TextStyle(
                        fontSize: 18,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment(-0.8, 0.0),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/John.jpg'),
                            radius: 50.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "&",
                              style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.pinkvariaance),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/kaif.jpg'),
                            radius: 50.0,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: size.width * 0.50,
                        height: 35,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.pinkvariaance,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: MyColors.whiteColor,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.only(left: 10, right: 0),
                              onPressed: () {},
                              elevation: 0,
                              color: MyColors.pinkvariaance,
                              child: Text(
                                "Show Interest",
                                style: TextStyle(
                                    color: MyColors.whiteColor, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColors.pinkvariaance),
                  child: Text(
                    string.maintabtitle5,
                    style: TextStyle(
                        fontSize: 17,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment(-0.8, 0.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Target wedding date :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "November 2015",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Name :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Nikhil Monga",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Gender :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "female",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Age :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "28",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Height :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "42 (127cms)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Complextion :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Dark",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Built :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Heavy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Native Language :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Hindi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Marital Status :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Unmarried",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Location :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Nepal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Religion :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Hindu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Education :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Doctorate",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Rasidency Status :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  height: 20,
                                  width: 60,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    //elevation: 0.1,
                                    color: MyColors.pinkvariaance,
                                    child: Text(
                                      "Ask?",
                                      style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Salary :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$2000000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width,
                          color: MyColors.grayText,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Proffession :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grayText,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Doctor",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.pinkvariaance,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 1,
                  width: size.width,
                  color: MyColors.grayText,
                ),
                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(top: 20, left: 150),
                        // padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/John.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.only(top: 20, right: 90),
                              // padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/John.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 180,
                                    margin: EdgeInsets.only(left: 70),
                                    // padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(300.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/John.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        string.user_name,
                        style: TextStyle(
                          color: MyColors.pinkvariaance,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          string.user_info,
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        string.user_location,
                        style: TextStyle(
                          color: MyColors.pinkvariaance,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: MyColors.grayText,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 1,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: size.width,
                        child: ListTile(
                          onTap: () {},
                          title: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  string.user_name,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: MyColors.pinkvariaance),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5, left: 2),
                                child: Text(
                                  "now Earns RS.2.40.000 per year",
                                  style: TextStyle(
                                      fontSize: 12, color: MyColors.grayText),
                                ),
                              )
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 2),
                                child: Text(
                                  "2 March 2018",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: MyColors.blackText,
                                  ),
                                ),
                              )
                            ],
                          ),
                          leading: GestureDetector(
                            onTap: () {
                              // _showMyDialog();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/John.jpg"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 1,
                        width: size.width,
                        color: MyColors.grayText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: MyColors.grayText,
                                  size: 30.0,
                                ),
                                Text("Connect")
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: MyColors.grayText,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sms,
                                  color: MyColors.grayText,
                                  size: 30.0,
                                ),
                                Text(
                                  "Comments",
                                  style: TextStyle(color: MyColors.blackText),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: MyColors.grayText,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Loading More.",
                            style: TextStyle(
                                color: MyColors.grayText, fontSize: 20),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: Bottom_bar(currentIndex: 0,),
    );
  }


  _membergetbyId() async {
    pref = await SharedPreferences.getInstance();
    profileImage = pref.getString('profile_Image');
    aadharImage = pref.getString('Aadhar_Image');
    String M_id = pref.getString("m_id");
    FormData formData = FormData.fromMap({
      "member_id" : M_id,
    });
    Services.memberViewById(formData).then((value) {
      if(value.response == 1){
        print(value.data);
        setState(() {
          print(value.message);
          Userdata = value.data;
        });
      }
    });

  }

  _status(int status) {
    switch(status){
      case 1:
        Status = "Single";
        break;
      case 2:
        Status = "Divoces";
        break;
      case 3:
        Status = "Window";
        break;
      case 4:
        Status = "Widower";
        break;
    }
    return Status;
  }
}
