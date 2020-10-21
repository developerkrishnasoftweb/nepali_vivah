import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/upload_photo.dart';
class ContactInfo extends StatefulWidget{

  final String maritalstatus,gender,m_month,m_year,town,firstname,laastname,dob,dob_place;
  ContactInfo({this.maritalstatus,this.gender,this.m_month,this.m_year,this.town,this.firstname,this.laastname,this.dob,this.dob_place});

  @override
  _ContactInfo createState() => _ContactInfo();
}
class _ContactInfo extends State<ContactInfo>{

  TextEditingController mobileno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Great! Wasn't that easy?", textAlign: TextAlign.center,),
          titleTextStyle: TextStyle(
            color: MyColors.pinkvariaance,
            fontSize: 20,
            fontFamily: "Philosopher",

          ),
          content: Text("So you are a " + marritalStatus + " " + gender + " looking to get married by " + month + " " + year + "\n Let's search a suitable " + partner + " for you\n",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2, left: MediaQuery.of(context).size.width * 0.2),
              child: FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                  _userRegistration();
                },
                child: Text("Begin Search",
                  style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 17
                  ),
                ),
                color: Dcolor.appPrimaryColor,
              ),
            )
          ],
          scrollable: true,
          // contentPadding: EdgeInsets.all(10.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        );
      },
    );
  }

  @override
  String marritalStatus = "Single";
  String gender = "Female";
  String month = "May";
  String year = "2018";
  String partner;
  Widget build(BuildContext context) {
    (gender == "Male" || gender == "male") ? partner ="bride" : partner = "";
    (gender == "Female" || gender == "female") ? partner ="groom" : partner = "";
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
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment(0.0, 0.0),
                          width: size.width,
                          child: Text("Almost done! Just a bit more info",
                            style: TextStyle(
                                fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 30),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.1,
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: "+91",
                                    hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: size.width * 0.7,
                                child: TextField(
                                  controller: mobileno,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "My phone number is",
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
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 10),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "My E-mail address is",
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
                                child: TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: "I choose my password to be",
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
                                    setState(() {
                                      _registration();
                                    });
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

  _registration() {
    if (mobileno.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Mobile",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (email.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (password.text== "") {
      Fluttertoast.showToast(
          msg: "Please enter password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (mobileno.text.length != 10) {
      Fluttertoast.showToast(
          msg: "Please enter 10 digit Phone Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else {
      _showMyDialog();
    }
  }

  _userRegistration() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPhoto(
      maritalstatus: widget.maritalstatus,
      gender: widget.gender,
      m_month: widget.m_month,
      m_year: widget.m_year,
      town: widget.town,
      firstname: widget.firstname,
      laastname: widget.laastname,
      dob: widget.dob,
      dob_place: widget.dob_place,
      mobileno: mobileno.text,
      email: email.text,
      password: password.text,
    )));
  }


}