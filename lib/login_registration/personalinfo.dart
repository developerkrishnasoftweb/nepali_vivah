import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/login_registration/contactinfo.dart';
import 'package:nepali_vivah/login_registration/lifestyle.dart';

class PersonalDetail extends StatefulWidget {

  final String maritalstatus,gender,m_month,m_year,town;
  PersonalDetail({this.maritalstatus,this.gender,this.m_month,this.m_year,this.town});

  @override
  _PersonalDetail createState() => _PersonalDetail();
}

class _PersonalDetail extends State<PersonalDetail> {
  TextEditingController date = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController bornplace = TextEditingController();

  DateTime picker;
  DateTime selectedDate = DateTime.now();

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
                            style: TextStyle(
                              fontSize: 20,
                              color: MyColors.blackText,
                            ),
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
                                  controller: firstname,
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
                                  controller: lastname,
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
                                  controller: date,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText: "Select Date og Birth",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: GestureDetector(
                                          onTap: () async {
                                            picker = await showDatePicker(
                                              context: context,
                                              initialDate: selectedDate,
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: ThemeData.dark(),
                                                  // This will change to light theme.
                                                  child: child,
                                                );
                                              },
                                            );
                                            if (picker != null &&
                                                picker != selectedDate)
                                              setState(() {
                                                selectedDate = picker;
                                                date.text = DateFormat("yyyy-MM-dd")
                                                    .format(selectedDate);
                                              });
                                          },
                                          child: Icon(Icons.calendar_today))),
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
                                  controller: bornplace,
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
                                    _registration();
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

  _registration() {
    if (firstname.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter f_name",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (lastname.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter L_name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (date.text== "") {
      Fluttertoast.showToast(
          msg: "Please enter DOB",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (bornplace.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Born Place",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else {
        _userRegistration();
    }
  }

  _userRegistration() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactInfo(
      maritalstatus: widget.maritalstatus,
      gender: widget.gender,
      m_month: widget.m_month,
      m_year: widget.m_year,
      town: widget.town,
      firstname: firstname.text,
      laastname: lastname.text ,
      dob: date.text,
      dob_place: bornplace.text,
    )));
  }


}
