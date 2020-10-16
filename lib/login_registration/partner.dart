import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/mainscreens/home.dart';
class PartnerInfo extends StatefulWidget{
  @override
  _PartnerInfo createState() => _PartnerInfo();
}
class _PartnerInfo extends State<PartnerInfo>{
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
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text("Now tell us the Qualities of the life partner\n You are looking for",
                            style: TextStyle(
                                color: MyColors.blackText,
                                fontSize: 19
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Religion",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Caste",
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
                          margin: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, bottom: 5),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.4,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Min age range",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: size.width * 0.4,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Max age range",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 5),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Drink",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 5),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Smoke",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 5),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Diet",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                                    hintText: "Marital Status",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: FlatButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                  },
                                  child: Text("Continue",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontSize: 17
                                    ),
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