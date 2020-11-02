import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Api_File/services.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchAdvance extends StatefulWidget {
  @override
  _SearchAdvanceState createState() => _SearchAdvanceState();
}

class _SearchAdvanceState extends State<SearchAdvance> {

  final List<String> age = List();
  static const lang = ['Odia', 'Telugu', 'Hindi', 'English'];
  static const marriage = ['Single', 'Divoces', 'Widow', 'Widower'];
  String maritalStatus;
  String Language;
  bool viewVisible = false;
  List Memberdata;
  TextEditingController _maxheight = TextEditingController();
  TextEditingController _minheight = TextEditingController();
  TextEditingController _minsalary = TextEditingController();
  TextEditingController _education = TextEditingController();
  TextEditingController _occuption = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _ageFrom = TextEditingController();
  TextEditingController _ageTo = TextEditingController();
  Icon clear;
  TextEditingController search = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: MyColors.pinkvariaance,
          title: Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.darkpink,
            ),
            child: TextField(
              onTap: () {
                viewVisible == false ? _showSerach() : _hideSerach();
              },
              readOnly: true,
              controller: search,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Dcolor.appGrayColor,
                  ),
                  suffixIcon: clear,
                  hintText: "Search for a member",
                  hintStyle: TextStyle(
                    color: Dcolor.appGrayColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 7, bottom: 7)),
              onChanged: (value) {
                setState(() {
                  (value.length > 0)
                      ? clear = Icon(
                    Icons.clear,
                    color: Dcolor.appGrayColor,
                  )
                      : clear = null;
                });
              },
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: MyColors.whiteColor,
              ),
              onPressed: () {},
              splashRadius: 20,
              splashColor: Dcolor.appGrayColor,
            )
          ],
        ),
        body: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Memberdata != null
              ? SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible,
                  child: Container(
                    height: size.height * 0.53,
                    width: size.width,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: size.width,
                          padding: EdgeInsets.only(top: 7, bottom: 15),
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "ADVANCED SEARCH",
                            style: TextStyle(
                              color: MyColors.blackText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    _CustomText("AgeFrom"),
                                    _CustomTextfield(
                                        context, _ageFrom, "Age From")
                                    //CustomDropDownButton(hint: "Age From",list: age, val: ageFrom,),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Marital Status"),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 5),
                                      height: 40,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(1),
                                        color: MyColors.boxbg,
                                      ),
                                      child: DropdownButton(
                                        hint: Text(
                                          "marital status",
                                          style: TextStyle(
                                            color: MyColors.blackText,
                                          ),
                                        ),
                                        value: maritalStatus,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: MyColors.blackText,
                                        ),
                                        iconSize: 20,
                                        elevation: 0,
                                        style: TextStyle(
                                            color:
                                            MyColors.blackText),
                                        dropdownColor:
                                        MyColors.whiteColor,
                                        onChanged: (String value) {
                                          setState(() {
                                            maritalStatus = value;
                                          });
                                        },
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        isExpanded: true,
                                        items: marriage.map<
                                            DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Min Height"),
                                    _CustomTextfield(
                                        context, _minheight, "Min Height")
                                    // CustomTextField(hint: "Min Height",contextontroller: _minheight,)
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Location"),
                                    _CustomTextfield(
                                        context, _location, "Location")
                                    //CustomTextField(hint: "Location",controller: _location,)
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Language"),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 5),
                                      height: 40,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(1),
                                        color: MyColors.boxbg,
                                      ),
                                      child: DropdownButton(
                                        hint: Text(
                                          "Language",
                                        ),
                                        value: Language,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: MyColors.blackText,
                                        ),
                                        iconSize: 20,
                                        elevation: 0,
                                        style: TextStyle(
                                            color:
                                            MyColors.blackText),
                                        dropdownColor:
                                        MyColors.whiteColor,
                                        onChanged: (String value) {
                                          setState(() {
                                            Language = value;
                                          });
                                        },
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        isExpanded: true,
                                        items: lang.map<
                                            DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    _CustomText("Age To"),
                                    _CustomTextfield(
                                        context, _ageTo, "Age To")
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Min Salary"),
                                    _CustomTextfield(
                                        context, _minsalary, "Min Salary")
                                    // CustomTextField(hint: "Min Salary",controller: _minsalary,)
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Max Height"),
                                    _CustomTextfield(
                                        context, _maxheight, "Max Height")
                                    // CustomTextField(hint: "Max Height",controller: _maxheight,)
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Education"),
                                    _CustomTextfield(
                                        context, _education, "Eduaction")
                                    //CustomTextField(hint: "Education",controller: _education,)
                                  ],
                                ),
                                Column(
                                  children: [
                                    _CustomText("Occupation"),
                                    _CustomTextfield(
                                        context, _occuption, "Occupation")
                                    //CustomTextField(hint: "Occupation",controller: _occuption,)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: size.width * 0.3,
                          height: 30,
                          margin: EdgeInsets.only(bottom: 20, top: 30.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {
                              _Searchmember();
                            },
                            color: MyColors.pinkvariaance,
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: MyColors.whiteColor,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              : SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(MyColors.pinkvariaance),
              )),
        ),
        bottomNavigationBar: Bottom_bar(
          currentIndex: 1,
        )
    );
  }


  _showSerach() {
    setState(() {
      viewVisible = true;
    });
  }

  _hideSerach() {
    setState(() {
      viewVisible = false;
    });
  }

  Container _CustomTextfield(
      BuildContext context, TextEditingController _controller, String hint) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: MyColors.boxbg,
      ),
      child: TextFormField(
        controller: _controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.pinkvariaance),
              borderRadius: BorderRadius.circular(3.0),
            )),
      ),
    );
  }

  _Searchmember() {
    if(_ageFrom.text == "" ){
      Fluttertoast.showToast(
          msg: "Please enter age From",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(int.parse(_ageFrom.text) <= 18){
      Fluttertoast.showToast(
          msg: "enter age between 18 to 65",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_ageTo.text == ""){
      Fluttertoast.showToast(
          msg: "Please enter age To",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(int.parse(_ageTo.text) >= 65){
      Fluttertoast.showToast(
          msg: "enter age between 18 to 65",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(maritalStatus == null){
      Fluttertoast.showToast(
          msg: "plz select maritalStatus",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_minsalary.text == ""){
      Fluttertoast.showToast(
          msg: "plz min enter salary",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_minheight == ""){
      Fluttertoast.showToast(
          msg: "plz enter min height",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_maxheight == ""){
      Fluttertoast.showToast(
          msg: "plz enter min height",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_location == ""){
      Fluttertoast.showToast(
          msg: "plz enter Location",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_education == ""){
      Fluttertoast.showToast(
          msg: "plz enter Education",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(Language== null){
      Fluttertoast.showToast(
          msg: "plz enter Location",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }else if(_occuption.text == ""){
      Fluttertoast.showToast(
          msg: "plz enter occupation",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    }
    else{
      _searchMember();
    }
  }

  _agestatus(String str) {
    switch (str) {
      case "Single":
        return 1;
        break;
      case "Divoces":
        return 2;
        break;
      case "Window":
        return 3;
        break;
      case "Widower":
        return 4;
        break;
    }
  }

  _searchMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    FormData formdata = FormData.fromMap({
      "member_id" : prefs.getString("m_id"),
      "gender" : prefs.getString("m_gender"),
      "min_age" : _ageFrom.text,
      "max_age" : _ageTo.text,
      "min_height" : _minheight.text,
      "max_height" : _maxheight.text,
      "min_salary" : _minsalary.text,
      "marital_status" : _agestatus(maritalStatus),
      "location" : _location.text,
      "highest_education" : _education.text,
      "language" : Language,
    });

    Services.searchMember(formdata).then((value) {
      if(value.response == 1){
        print(value.message);
      }else{
        print("not work");
      }
    });


  }
}

Container _CustomText(String title) {
  return Container(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
  );
}