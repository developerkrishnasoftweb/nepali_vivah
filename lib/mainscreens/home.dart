import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/Common/LoginMemberImage.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  String interest = "Interest", follow = "Follow", ignore = "Ignore";
  String Advertisement_image;
  List Memberdata;
  List Advertise;
  List Matched_profile;
  var agestatus;
  String Status;
  String profileImage;
  String aadharImage;
  List Userdata;
  List interestedMembers;
  List followMembers;
  List ignoreMembers;

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

  Widget interestBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _interest(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.blackText,
              width: 1,
            )),
        child: Center(
            child: Text(
          "Interest",
          style: TextStyle(
              fontSize: 12.0,
              color: MyColors.blackText,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget notInterestBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _interestdelete(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.pinkvariaance,
              width: 1,
            )),
        child: Center(
            child: Text(
          "Not Interested",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 11.0,
              color: MyColors.pinkvariaance,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget followBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _follow(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.blackText,
              width: 1,
            )),
        child: Center(
            child: Text(
          "Follow",
          style: TextStyle(
              fontSize: 12.0,
              color: MyColors.blackText,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget unfollowBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _followdelete(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.pinkvariaance,
              width: 1,
            )),
        child: Center(
            child: Text(
          "UnFollow",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 11.0,
              color: MyColors.pinkvariaance,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget ignoreBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _ignore(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.blackText,
              width: 1,
            )),
        child: Center(
            child: Text(
          "Ignore",
          style: TextStyle(
              fontSize: 12.0,
              color: MyColors.blackText,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget unignoreBtn(int index) {
    return GestureDetector(
      onTap: () {
        var id = Matched_profile[index]["member_id"];
        _ignoredelete(id);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: MyColors.pinkvariaance,
              width: 1,
            )),
        child: Center(
            child: Text(
          "UnIgnore",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 11.0,
              color: MyColors.pinkvariaance,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  @override
  var _index;
  Icon clear;
  TextEditingController search = TextEditingController();

  Widget build(BuildContext context) {
    Widget _showProfiles(BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                      image: NetworkImage(profileImage +
                          Matched_profile[index]["profile_image"]))),
            ),
            Container(
              child: Text(
                Matched_profile[index]["first_name"] +
                    " " +
                    Matched_profile[index]["last_name"],
                style: TextStyle(
                  color: MyColors.pinkvariaance,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                Matched_profile[index]["age"].toString() +
                    " " +
                    _status(Matched_profile[index]["marital_status_id"]),
                style: TextStyle(
                  color: MyColors.blackText,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 70,
                  height: 30,
                  child: interestedMembers.contains(
                          Matched_profile[index]["member_id"].toString())
                      ? notInterestBtn(index)
                      : interestBtn(index),
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: followMembers.contains(
                          Matched_profile[index]["member_id"].toString())
                      ? unfollowBtn(index)
                      : followBtn(index),
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: ignoreMembers.contains(
                          Matched_profile[index]["member_id"].toString())
                      ? unignoreBtn(index)
                      : ignoreBtn(index),
                ),
              ],
            )
          ],
        ),
      );
    }

    (widget.navbarIndex != null) ? _index = widget.navbarIndex : _index = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: MyColors.pinkvariaance,
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
                                      image: NetworkImage(Advertisement_image +
                                          Advertise[0]["top_advertisement"]),
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
                        height: 200,
                        width: size.width,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemCount: Matched_profile.length,
                          itemBuilder: _showProfiles,
                          scrollDirection: Axis.horizontal,
                          itemExtent: 230,
                        ),
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
                        child: MemberImages(
                          profileImage: profileImage,
                          Userdata: Userdata,
                        ),
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
      "member_id": M_id,
    });
    await Services.memberViewById(formData).then((value) async {
      if (value.response == 1) {
        setState(() {
          Userdata = value.data;
          interestedMembers = value.data[0]["interest"].toString().split(",");
          followMembers = value.data[0]["followed"].toString().split(",");
          ignoreMembers = value.data[0]["ignored"].toString().split(",");
        });
        _matched_profile();
      }
    });
  }

  _status(int status) {
    switch (status) {
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

  _follow(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.followadd(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }

  _followdelete(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.followdelete(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }

  _interest(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.interestadd(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }

  _interestdelete(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.interestdelete(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }

  _ignore(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.ignoreadd(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }

  _ignoredelete(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.ignoredelete(d).then((value) {
      if (value.response == 1) {
        _membergetbyId();
      }
    });
  }
}
