import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/mainscreens/home.dart';

class CustomDropDownButton extends StatefulWidget {
  String val,hint;
  List<String> list;
  CustomDropDownButton({this.val,this.list,this.hint});
  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 5),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: MyColors.boxbg,
        ),
        child: DropdownButton(
          hint: Text(widget.hint,),
          value: widget.val,
          icon: Icon(Icons.keyboard_arrow_down,),
          iconSize: 20,
          elevation: 0,
          style: TextStyle(color: MyColors.pinkvariaance),
          dropdownColor: MyColors.whiteColor,
          onChanged: (String value) {
            setState(() {
              widget.val = value;
            });
          },
          underline: Container(color: Colors.transparent,),
          isExpanded: true,
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
}

