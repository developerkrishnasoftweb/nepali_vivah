import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberImages extends StatefulWidget {
  String profileImage;
  List Userdata;
  MemberImages({this.profileImage,this.Userdata});

  @override
  _MemberImagesState createState() => _MemberImagesState();
}

class _MemberImagesState extends State<MemberImages> {
  @override
  void initState() {
    // TODO: implement initState
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image:NetworkImage(widget.profileImage+widget.Userdata[0]["profile_image"]),
                fit: BoxFit.fill,
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
                      image:NetworkImage(widget.profileImage+widget.Userdata[0]["profile_image"]),
                      fit: BoxFit.fill,
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
                            image: NetworkImage(widget.profileImage+widget.Userdata[0]["profile_image"]),
                            fit: BoxFit.fill,
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
    );
  }
}
