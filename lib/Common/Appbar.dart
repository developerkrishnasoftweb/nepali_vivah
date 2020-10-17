import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import '../constant/string.dart';

class Appbar_Top extends StatefulWidget {
  @override
  _Appbar_TopState createState() => _Appbar_TopState();
}

class _Appbar_TopState extends State<Appbar_Top> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
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
        ],
      ),
    );
  }
}
