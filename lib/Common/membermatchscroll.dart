import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/mainscreens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Membermatch_profile extends StatefulWidget {
  String profileImage;
  var agestatus;
  List Matched_profile,Userdata;

  Membermatch_profile({this.profileImage,this.Matched_profile,this.Userdata,this.agestatus});
  @override
  _Membermatch_profileState createState() => _Membermatch_profileState();
}

class _Membermatch_profileState extends State<Membermatch_profile> {
  SharedPreferences prefs;
  String Status;
  bool follow = false,ignore = false,interest = false;
  var agestatus;

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 200,
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.Matched_profile.length,
            itemBuilder: (context, index) {

              agestatus = widget.Matched_profile[index]["marital_status_id"];
              return GestureDetector(
                onTap: () {
                  // _getMember();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Screen1()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(
                              image: NetworkImage(widget.profileImage +
                                  widget.Matched_profile[index]["profile_image"]),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: size.width,
                        alignment: Alignment.center,
                        child: Text(
                          widget.Matched_profile[index]["first_name"] +
                              " " +
                              widget.Matched_profile[index]["last_name"],
                          style: TextStyle(
                              fontSize: 15, color: MyColors.pinkvariaance),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: size.width,
                        alignment: Alignment.center,
                        child: Text(
                          widget.Matched_profile[index]["age"].toString() +
                              " " +
                              _status(agestatus),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: widget.Userdata[0]["interest"].toString().split(",")[widget.Userdata[0]["interest"]
                                                      .toString().split(",").length >index
                                              ? index
                                              : 0].toString() == widget.Matched_profile[index]["member_id"].toString() && interest == false
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          var id =
                                          widget.Matched_profile[index]["member_id"];
                                          _interestdelete(id);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              color: MyColors.pinkvariaance,
                                              width: 1,
                                            )),
                                        child: Center(
                                          child: Text(
                                            "Not Interested",
                                            style: TextStyle(
                                                fontSize: 9.0,
                                                color: MyColors.pinkvariaance,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        var id;
                                        setState(() {
                                          id = widget.Matched_profile[index]
                                              ["member_id"];
                                          print(id);
                                          _interest(id);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                    )
                          ),
                          Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: widget.Userdata[0]["followed"].toString().split(",")[widget.Userdata[0]["followed"].toString().split(",").length >index
                                              ? index
                                              : 0].toString() == widget.Matched_profile[index]["member_id"].toString()
                                  ? GestureDetector(
                                      onTap: () {
                                        var id =
                                            widget.Matched_profile[index]["member_id"];
                                        print(id);
                                        _follow(id);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              color: MyColors.pinkvariaance,
                                              width: 1,
                                            )),
                                        child: Center(
                                            child: Text(
                                          "Unfollow",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: MyColors.pinkvariaance,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        var id =
                                            widget.Matched_profile[index]["member_id"];
                                        print(id);
                                        _followdelete(id);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              color: MyColors.blackText,
                                              width: 1,
                                            )),
                                        child: Center(
                                            child: Text(
                                          "follow",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: MyColors.blackText,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    )),
                          Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: widget.Userdata[0]["ignored"]
                                        .toString()
                                        .split(",")[widget.Userdata[0]["ignored"]
                                                    .toString()
                                                    .split(",")
                                                    .length >
                                                index
                                            ? index
                                            : 0]
                                        .toString() ==
                                    widget.Matched_profile[index]["member_id"]
                                        .toString()
                                ? GestureDetector(
                                    onTap: () {
                                      var id =
                                          widget.Matched_profile[index]["member_id"];
                                      _Ignore(id);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            color: MyColors.pinkvariaance,
                                            width: 1,
                                          )),
                                      child: Center(
                                          child: Text(
                                        "Uningnore",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyColors.pinkvariaance,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      var id =
                                          widget.Matched_profile[index]["member_id"];
                                      //_Ignore(id);
                                      _ignoredelete(id);
                                      print("hello");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                            color: MyColors.blackText,
                                            width: 1,
                                          )),
                                      child: Center(
                                          child: Text(
                                        "Ignored",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyColors.blackText,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
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

  _follow(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.followadd(d).then((value) {
      if (value.response == 1) {
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
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
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      }
    });
  }

  _interest(int id) async {
    setState(() {
      interest = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.interestadd(d).then((value) {
      if (value.response == 1) {
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
        setState(() {
          interest = true;
        });
      }
    });
  }

  _interestdelete(int id) async {
    setState(() {
      interest = false;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.interestdelete(d).then((value) {
      if (value.response == 1) {
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
        setState(() {
          interest = false;
        });
      }
    });
  }

  _Ignore(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData d = FormData.fromMap({
      "member_id": prefs.getString("m_id"),
      "id": id,
    });
    Services.ignoreadd(d).then((value) {
      if (value.response == 1) {
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
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
        Fluttertoast.showToast(
          msg: value.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: MyColors.blackText,
          textColor: MyColors.whiteColor,
          timeInSecForIosWeb: 1,
          fontSize: 16,
        );
      }
    });
  }

}
