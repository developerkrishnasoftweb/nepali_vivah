import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';

class ShowMembers extends StatefulWidget {
  List Memberdata;
  String profileImage;

  ShowMembers({this.Memberdata, this.profileImage});

  @override
  _ShowMembersState createState() => _ShowMembersState();
}

class _ShowMembersState extends State<ShowMembers> {
  String Status;
  var ageStatus;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ageStatus = widget.Memberdata[0]["marital_status_id"];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
          alignment: Alignment.center,
          child: widget.Memberdata != null
              ? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        height: 170,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(widget.profileImage + widget.Memberdata[0]["profile_image"]),
                                          radius: 50.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.Memberdata[0]["first_name"] +
                                          " " +
                                          widget.Memberdata[0]["last_name"],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: MyColors.blackText,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: size.width * 0.96,
                        decoration: BoxDecoration(
                          color: MyColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 1.6, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                child: Text(
                                  "Quick Information",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 19.0),
                                ),
                              margin: EdgeInsets.only(bottom: 15.0,top: 10.0),
                            ),
                            Container(
                              height: 1,
                              width: size.width,
                              margin: EdgeInsets.only(bottom: 10.0),
                              color: MyColors.pinkvariaance,
                            ),
                            Container(
                              height: 1,
                              width: size.width,
                              color: MyColors.grayText,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Member ID :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["mahasangh_id"],
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
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "First Name :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["first_name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Last Name :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["last_name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Gender :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["gender"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Age :",
                                      style: TextStyle(
                                          color: MyColors.blackText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["age"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Number of Children :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                          widget.Memberdata[0]["number_of_children"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                            // Container(
                            //   padding: EdgeInsets.only(top: 10, bottom: 10),
                            //   width: MediaQuery.of(context).size.width * 0.95,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Container(
                            //         child: Text(
                            //           "Complextion :",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.grayText,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //       Container(
                            //         child: Text(
                            //           jsonDecode(widget.Memberdata[0]
                            //           ["physical_attributes"])[0]
                            //           ["Complexion"]
                            //               .toString(),
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.pinkvariaance,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   height: 1,
                            //   width: size.width,
                            //   color: MyColors.grayText,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 10, bottom: 10),
                            //   width: MediaQuery.of(context).size.width * 0.95,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Container(
                            //         child: Text(
                            //           "Native Language :",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.grayText,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //       Container(
                            //         child: Text(
                            //           jsonDecode(widget.Memberdata[0]["language"])[0]
                            //           ["Mother_tongue"],
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.pinkvariaance,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   height: 1,
                            //   width: size.width,
                            //   color: MyColors.grayText,
                            // ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Marital Status :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      _status(ageStatus),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.all(10.0),
                        width: size.width * 0.96,
                        decoration: BoxDecoration(
                            color: MyColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 12.0, // soften the shadow
                                spreadRadius: 1.6, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 10  horizontally
                                  6.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Partener Expectation",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 19.0),
                              ),
                              margin: EdgeInsets.only(bottom: 15.0,top: 10.0),
                            ),
                            Container(
                              height: 1,
                              width: size.width,
                              margin: EdgeInsets.only(bottom: 10.0),
                              color: MyColors.pinkvariaance,
                            ),
                            Container(
                              height: 1,
                              width: size.width,
                              color: MyColors.grayText,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Member ID :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["mahasangh_id"],
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
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "First Name :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["first_name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Last Name :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["last_name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Gender :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["gender"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Age :",
                                      style: TextStyle(
                                          color: MyColors.blackText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["age"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Number of Children :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.blackText,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.Memberdata[0]["number_of_children"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
                            // Container(
                            //   padding: EdgeInsets.only(top: 10, bottom: 10),
                            //   width: MediaQuery.of(context).size.width * 0.95,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Container(
                            //         child: Text(
                            //           "Complextion :",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.grayText,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //       Container(
                            //         child: Text(
                            //           jsonDecode(widget.Memberdata[0]
                            //           ["physical_attributes"])[0]
                            //           ["Complexion"]
                            //               .toString(),
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.pinkvariaance,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   height: 1,
                            //   width: size.width,
                            //   color: MyColors.grayText,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 10, bottom: 10),
                            //   width: MediaQuery.of(context).size.width * 0.95,
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            //     children: <Widget>[
                            //       Container(
                            //         child: Text(
                            //           "Native Language :",
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.grayText,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //       Container(
                            //         child: Text(
                            //           jsonDecode(widget.Memberdata[0]["language"])[0]
                            //           ["Mother_tongue"],
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors.pinkvariaance,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   height: 1,
                            //   width: size.width,
                            //   color: MyColors.grayText,
                            // ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Marital Status :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.blackText,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      _status(ageStatus),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.grayText,
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
      ),
      bottomNavigationBar: Bottom_bar(currentIndex: 2),
    );
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
}
