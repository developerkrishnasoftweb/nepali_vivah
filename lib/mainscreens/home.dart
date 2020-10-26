// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
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
  List Memberdata;
  var agestatus;
  String Status;
  String profileImage;
  String aadharImage;

  @override
  void initState() {
    _getMember();
    _getcradintional();
    super.initState();
  }

  _getcradintional() async {
    prefs = await SharedPreferences.getInstance();
    profileImage = prefs.getString('profile_Image');
    aadharImage = prefs.getString('Aadhar_Image');
  }

  @override
  var _index;
  Icon clear;
  TextEditingController search = TextEditingController();

  Widget build(BuildContext context) {
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
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Memberdata.length,
                                  itemBuilder: (context, index) {
                                    agestatus =
                                        Memberdata[index]["marital_status_id"];
                                    return GestureDetector(
                                      onTap: () {
                                        // _getMember();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => Screen1()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: MyColors.whiteColor,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(80),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        profileImage +
                                                            Memberdata[index][
                                                                "profile_image"]),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              width: size.width,
                                              alignment: Alignment.center,
                                              child: Text(
                                                Memberdata[index]
                                                        ["first_name"] +
                                                    " " +
                                                    Memberdata[index]
                                                        ["last_name"],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color:
                                                        MyColors.pinkvariaance),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              width: size.width,
                                              alignment: Alignment.center,
                                              child: Text(
                                                Memberdata[index]["age"]
                                                        .toString() +
                                                    " " +
                                                    _status(agestatus),
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: FlatButton(
                                                      child: Text(
                                                        "Interest",
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        var id =
                                                            Memberdata[index]
                                                                ["member_id"];
                                                        print(id);
                                                        _interest(id);
                                                      }),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: FlatButton(
                                                      child: Text(
                                                        "Follow",
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        var id =
                                                            Memberdata[index]
                                                                ["member_id"];
                                                        print(id);
                                                        _follow(id);
                                                      }),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: FlatButton(
                                                      child: Text(
                                                        "ignore",
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        var id =
                                                            Memberdata[index]
                                                                ["member_id"];
                                                        _Ignore(id);
                                                      }),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 110,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/user_image.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(top: 60, bottom: 20),
                        alignment: Alignment(0.0, 0.0),
                        child: Text(
                          "Recommended member for you",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              margin: EdgeInsets.only(top: 20, left: 150),
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
                                    margin: EdgeInsets.only(top: 20, right: 90),
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
                                  Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 220,
                                          height: 220,
                                          margin: EdgeInsets.only(left: 60),
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
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.followadd(d).then((value) {
      if (value.response == 1) {
        print(value.message);
      }
    });
  }

  _interest(int id) async {
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.interestadd(d).then((value) {
      if (value.response == 1) {
        print(value.message);
      }
    });
  }

  _Ignore(int id) async {
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.ignoreadd(d).then((value) {
      if (value.response == 1) {
        print(value.message);
      }
    });
  }
}
