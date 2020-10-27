// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/Common/LoginMemberImage.dart';
import 'package:nepali_vivah/Common/membermatchscroll.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nepali_vivah/mainscreens/Screen1.dart';
import 'package:nepali_vivah/mainscreens/chat_home.dart';
import 'package:nepali_vivah/mainscreens/main.dart';
import 'package:nepali_vivah/mainscreens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';

class Home extends StatefulWidget {
  Home({this.navbarIndex}) : super();
  final int navbarIndex;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  SharedPreferences prefs;
  String follow = "follow", ingnore = "ingnore", interest = "interest";
  String Advertisement_image;
  List Memberdata;
  List Advertise;
  List Matched_profile;
  var agestatus;
  String Status;
  String profileImage;
  String aadharImage;
  List Userdata;

  @override
  void initState() {
    _getMember();
    _getcradintional();
    _Advertisements();
    _matched_profile();
    _membergetbyId();
    super.initState();
  }

  _getcradintional() async {
    prefs = await SharedPreferences.getInstance();
    profileImage = prefs.getString('profile_Image');
    aadharImage = prefs.getString('Aadhar_Image');
    Advertisement_image = prefs.getString("Advertisement_Image");
  }

  @override
  var _index;
  Icon clear;
  TextEditingController search = TextEditingController();
  Widget build(BuildContext context) {
    // print("interest list"+Userdata[0]["interest"].toString().split(",")[0]);
    (widget.navbarIndex != null) ? _index = widget.navbarIndex : _index = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.pinkvariaance,
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: MyColors.whiteColor,
            ),
            onPressed: () {},
            splashColor: Dcolor.appGrayColor,
          ),
          title: Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.darkpink,
            ),
            child: TextField(
              controller: search,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Dcolor.appGrayColor,
                  ),
                  suffixIcon: clear,
                  hintText: "Search for a member",
                  hintStyle: TextStyle(
                    color: Dcolor.appGrayColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 7, bottom: 7)),
              onChanged: (value) {
                setState(() {
                  (value.length > 0)
                      ? clear = Icon(
                          Icons.clear,
                          color: Dcolor.appGrayColor,
                        )
                      : clear = null;
                });
              },
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: MyColors.whiteColor,
              ),
              onPressed: () {},
              splashRadius: 20,
              splashColor: Dcolor.appGrayColor,
            )
          ],
        ),
        body: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Memberdata != null
              ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: size.width,
                        child: CarouselSlider(
                          height: 190,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 19 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 600),
                          viewportFraction: 1.0,
                          items: [
                            Container(
                              margin: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/user_image.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        alignment: Alignment(0.0, 0.0),
                        child: Text(
                          "You might be interested in",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 200,
                        child: Membermatch_profile(Matched_profile: Matched_profile,profileImage: profileImage,agestatus: agestatus,Userdata: Userdata,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 110,
                        width: size.width * 0.96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(Advertisement_image +
                                Advertise[0]["middle_advertisement"]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        alignment: Alignment(0.0, 0.0),
                        child: Text(
                          "Recommended member for you",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        child: MemberImages(profileImage: profileImage,Userdata: Userdata,),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(MyColors.pinkvariaance),
                  )),
        ),
        bottomNavigationBar: Bottom_bar(
          currentIndex: 1,
        ));
  }

  _getMember() async {
    await Services.MemberView().then((value) {
      if (value.response == 1) {
        setState(() {
          Memberdata = value.data;
        });
      }
    });
  }

  _Advertisements() async {
    await Services.Advertisements().then((value) {
      if (value.response == "1") {
        setState(() {
          Advertise = value.data;
        });
      }
    });
  }


  _matched_profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "gender": prefs.getString("m_gender"),
    });

    await Services.matched_profile(d).then((value) {
      if (value.response == 1) {
        print(value.data.length);
        for(int i = 0; i < value.data.length; i++)
          print(value.data[i]);
        setState(() {
          Matched_profile = value.data;
        });
      }
    });
  }

  _membergetbyId() async {
    prefs = await SharedPreferences.getInstance();
    profileImage = prefs.getString('profile_Image');
    aadharImage = prefs.getString('Aadhar_Image');

    String M_id = prefs.getString("m_id");

    FormData formData = FormData.fromMap({
      "member_id" : M_id,
    });
    await Services.memberViewById(formData).then((value) async {
      if(value.response == 1){
        print("work is profile"+value.data.toString());
        setState(() {
          Userdata = value.data;
        });
      }
    });
  }
}
