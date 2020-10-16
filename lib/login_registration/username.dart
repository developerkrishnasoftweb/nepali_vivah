import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/partner.dart';

class Username extends StatefulWidget {
  @override
  _Username createState() => _Username();
}

class _Username extends State<Username> {
  @override
  var autoUsername = "Durgesh15";
  TextEditingController username = TextEditingController();

  Widget build(BuildContext context) {
    username.text = autoUsername;
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
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Expanded(
                            child: Text(
                              "For easy reference of your profile, please choose a preferred username",
                              style: TextStyle(fontSize: 20,color: MyColors.blackText,),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.3,
                                    height: 50,
                                    alignment: Alignment(0.0, 0.0),
                                    child: Text(
                                      "USERNAME",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.60,
                                    height: 30,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                          width: 2,
                                            color: Dcolor.appDarkColor),
                                        borderRadius:
                                            BorderRadius.circular(10),),
                                    child: TextField(
                                      controller: username,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 12,
                                            left: 15,
                                            right: 0),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: size.width * 0.9,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment(1.0, 0.0),
                                child: Text(
                                  "Automatic Generated Username",
                                  style: TextStyle(
                                      color: MyColors.grayText, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "Automated Generated Username",
                            style: TextStyle(fontSize: 14,color: MyColors.blackText,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "The username above has been automatically generated by our system. Please type a username in the box above or choose from the suggestion whatever is easy for you to remember. If you pick 'abc' as your USERNAME, your profile can be viewed as",
                            style: TextStyle(fontSize: 16,color: MyColors.grayText,),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width,
                          child: Text(
                            "http://www.nepalivivah.com/abc",
                            style: TextStyle(
                                fontSize: 16,
                                color: Dcolor.appGreenColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: size.width * 0.9,
                                child: Text(
                                  "Username Suggestion",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: MyColors.blackText)),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: Text("Durgesh15"),
                                      groupValue: autoUsername,
                                      value: "Durgesh15",
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    ),
                                    Divider(color: MyColors.blackText,thickness: 1,),
                                    RadioListTile(
                                      title: Text("Durgesh14"),
                                      groupValue: autoUsername,
                                      value: "Durgesh14",
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    ),
                                    Divider(color: MyColors.blackText,thickness: 1,),
                                    RadioListTile(
                                      title: Text("Durgesh101"),
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                      groupValue: autoUsername,
                                      value: "Durgesh101",
                                    ),
                                    Divider(color: MyColors.blackText,thickness: 1,),
                                    RadioListTile(
                                      title: Text("Durgesh155"),
                                      groupValue: autoUsername,
                                      value: "Durgesh155",
                                      onChanged: (value) {
                                        setState(() {
                                          autoUsername = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 20,top:10.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PartnerInfo()));
                            },
                            color: MyColors.pinkvariaance,
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(color: MyColors.whiteColor, fontSize: 20),
                            ),
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
