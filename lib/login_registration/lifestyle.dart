import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/professionalinfo.dart';

class Lifestyle extends StatefulWidget {
  @override
  _Lifestyle createState() => _Lifestyle();
}

class _Lifestyle extends State<Lifestyle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Appbar_Top(),
              Positioned(
                top: 60,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text(
                            "My Lifestyle",
                            style: TextStyle(
                                color: MyColors.blackText, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Aaditya Pankaj",
                                style: TextStyle(
                                    color: MyColors.pinkvariaance,
                                    fontSize: 20),
                              ),
                              Text(
                                "(Tell us about yourself so that we can find the most suitable match for you.)",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: MyColors.blackText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "What's your diet ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 25,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Do you smoke ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 25,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Do you drink ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 25,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfessionalInfo()));
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 17),
                                  ),
                                  color: MyColors.pinkvariaance,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
