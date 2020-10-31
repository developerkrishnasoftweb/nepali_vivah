import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;

  CustomTextField({this.controller,this.hint});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: MyColors.boxbg,
      ),
      child: TextField(controller: widget.controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.pinkvariaance),
              borderRadius: BorderRadius.circular(3.0),)
        ),
      ),
    );
  }
}
