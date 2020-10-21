import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          // title: Text(Strings.title),
          title: Text(
            Strings.title,
            style: TextStyle(color: MyColors.whiteColor),
          ),
          centerTitle: true,
          elevation: 4.0,
          backgroundColor: MyColors.pinkvariaance,
          bottom: TabBar(
            indicatorColor: MyColors.whiteColor,
            tabs: [
              Tab(
                child: Text("ipay",
                    style: TextStyle(fontSize: 17, color: MyColors.whiteColor)),
              ),
              // Container(
              //   height: 10,
              //   width: 1,
              //   color: Colors.white,
              // ),
              Tab(
                child: Text("Pay by card",
                    style: TextStyle(fontSize: 17, color: MyColors.whiteColor)),
              ),
              Tab(
                child: Text("Pay by person",
                    style: TextStyle(fontSize: 14, color: MyColors.whiteColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: [
                    Text(
                      "Subscription Details",
                      style: TextStyle(
                        color: MyColors.pinkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Finding a partner takes some times.Best plan always works the best",
                      style: TextStyle(
                          fontSize: 18, decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "View any member's profile",
                                      style: TextStyle(
                                          color: Dcolor.appPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 10),
                                    child: Text(
                                      "Show interest and send message to any members you are interested in",
                                      style: TextStyle(
                                          color: MyColors.pinkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 10),
                                    child: Text(
                                      "Search a list of member who match your profile.",
                                      style: TextStyle(
                                          color: MyColors.pinkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 10),
                                    child: Text(
                                      "You can see matching percentile with a member",
                                      style: TextStyle(
                                          color: MyColors.pinkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 10),
                                    child: Text(
                                      "Get notification if someone viewed your profile or uploaded photo.",
                                      style: TextStyle(
                                          color: MyColors.pinkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: MyColors.pinkColor,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 10),
                                    child: Text(
                                      "Get notification if a member is interested in you",
                                      style: TextStyle(
                                          color: MyColors.pinkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: 230.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: RaisedButton(
                                        color: MyColors.grayText,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft:
                                                    Radius.circular(10.0))),
                                        child: Text(
                                          "Good Plan",
                                          style: TextStyle(
                                              color: MyColors.whiteColor,
                                              fontSize: 18),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.grey[200],
                                width: 230.0,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 650 INR / Month",
                                          style: TextStyle(
                                              // color: MyColors.grayText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 650 INR / 1 Month",
                                          style: TextStyle(
                                              color: MyColors.grayText),
                                        )),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 20),
                                      width: 135.0,
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: RaisedButton(
                                          color: MyColors.grayText,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: Text(
                                            "Subscribe",
                                            style: TextStyle(
                                                color: MyColors.whiteColor),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: 230.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: RaisedButton(
                                        color: MyColors.lightgreen,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft:
                                                    Radius.circular(10.0))),
                                        child: Text(
                                          "Better Plan",
                                          style: TextStyle(
                                              color: MyColors.whiteColor,
                                              fontSize: 18),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.certificate,
                                        color: Colors.green[600],
                                        size: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18, top: 15),
                                        child: Column(
                                          children: [
                                            Text("10%",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Text("OFF",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.grey[200],
                                width: 230.0,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 585 INR / Month",
                                          style: TextStyle(
                                              // color: MyColors.grayText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 1752 INR / 1 Month",
                                          style: TextStyle(
                                              color: MyColors.grayText),
                                        )),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 20),
                                      width: 135.0,
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: RaisedButton(
                                          color: MyColors.lightgreen,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: Text(
                                            "Subscribe",
                                            style: TextStyle(
                                                color: MyColors.whiteColor),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    width: 230.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: RaisedButton(
                                        color: MyColors.pinkColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft:
                                                    Radius.circular(10.0))),
                                        child: Text(
                                          "Best Plan",
                                          style: TextStyle(
                                              color: MyColors.whiteColor,
                                              fontSize: 18),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.certificate,
                                        color: Colors.red[700],
                                        size: 60,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 18, top: 15),
                                        child: Column(
                                          children: [
                                            Text("10%",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Text("OFF",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.grey[200],
                                width: 230.0,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 553 INR / Month",
                                          style: TextStyle(
                                              // color: MyColors.grayText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "\$ 3352 INR / 1 Month",
                                          style: TextStyle(
                                              color: MyColors.grayText),
                                        )),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 20),
                                      width: 135.0,
                                      height: 45,
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: RaisedButton(
                                          color: MyColors.pinkColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: Text(
                                            "Subscribe",
                                            style: TextStyle(
                                                color: MyColors.whiteColor),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ]),
            Container(
              child: Text("Worghtchvhvk"),
            ),
            Container(
              child: Text("hard"),
            )
          ],
        ),
        bottomNavigationBar: Bottom_bar(),
      ),
    );
  }
}
