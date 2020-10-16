import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/username.dart';

class UploadPhoto extends StatefulWidget {
  @override
  _UploadPhoto createState() => _UploadPhoto();
}

class _UploadPhoto extends State<UploadPhoto> {
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
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  height: 60,
                  color: MyColors.pinkvariaance,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          string.registrationTitleTop,
                          style: TextStyle(
                              fontSize: 18,
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: size.width * 0.1),
                        child: Text(
                          string.registrationTitleBottom,
                          style: TextStyle(
                              fontSize: 18,
                              color: MyColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text(
                            "Welcome to nepalivivah!\n Let's help you with next steps.",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Aaditya Pankaj",
                                style: TextStyle(
                                    color: MyColors.pinkvariaance,
                                    fontSize: 20),
                              ),
                              Container(
                                  width: size.width * 0.85,
                                  child: Text(
                                    "(Please upload your beautiful photos  now Remember, no one wants to show an interest in your profile if you don't have photos.)",
                                    style: TextStyle(fontSize: 15,color: MyColors.grayText),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: size.width * 0.85,
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Image(
                                  height: size.height * 0.18,
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {},
                                  color: MyColors.pinkvariaance,
                                  child: Text(
                                    "Upload photo",
                                    style: TextStyle(
                                        color: MyColors.whiteColor, fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: size.width * 0.9,
                                height: 40,
                                alignment: Alignment(-1.0, 0.0),
                                child: Text(
                                  "Upload Additional Photos(click on photo)",
                                  style: TextStyle(fontSize: 17,color: MyColors.grayText),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.3,
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Image(
                                        height: size.height * 0.1,
                                        image: AssetImage(
                                            "assets/images/user.png"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.3,
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Image(
                                        height: size.height * 0.1,
                                        image: AssetImage(
                                            "assets/images/user.png"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.3,
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Image(
                                        height: size.height * 0.1,
                                        image: AssetImage(
                                            "assets/images/user.png"),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Username()));
                                  },
                                  color: Dcolor.appGrayColor,
                                  child: Text(
                                    "Skip",
                                    style: TextStyle(
                                        color: MyColors.whiteColor, fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
