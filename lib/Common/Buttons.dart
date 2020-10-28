import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Buttons extends StatefulWidget {
  final dynamic onTap;
  String btntitle;
  Color btncolor;
  List Matched_profile;
  Buttons({this.onTap,this.btntitle,this.Matched_profile,this.btncolor});
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
              BorderRadius.circular(6),
              border: Border.all(
                color: widget.btncolor,
                width: 1,
              )),
          child: Center(
              child: Text(
                widget.btntitle,
                style: TextStyle(
                    fontSize: 12.0,
                    color: widget.btncolor,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
