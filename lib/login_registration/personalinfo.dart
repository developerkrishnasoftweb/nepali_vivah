import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/lifestyle.dart';

class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetail createState() => _PersonalDetail();
}

class _PersonalDetail extends State<PersonalDetail> {
  @override
  Widget build(BuildContext context) {
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
                            "Tell us who you are",
                            style: TextStyle(fontSize: 20,color: MyColors.blackText,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                              bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText, fontSize: 17),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: size.width * 0.4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText, fontSize: 17),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                              bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "When were you born ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(Icons.calendar_today)),
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Where were you born ?",
                                    hintStyle: TextStyle(
                                      color: MyColors.grayText,
                                      fontSize: 17,
                                    ),
                                  ),
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
                                            builder: (context) => Lifestyle()));
                                  },
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: MyColors.whiteColor, fontSize: 17),
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
