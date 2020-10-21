import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/contactinfo.dart';
class ProfessionalInfo extends StatefulWidget{
  String fname,lname,dob,dob_place,maritalstatus,gender,m_month,m_year,message,diet,smoke,drink;
  ProfessionalInfo({this.fname,this.lname,this.dob,this.dob_place,this.maritalstatus,this.gender,this.m_month,this.m_year,this.message,this.diet,this.smoke,this.drink});

  @override
  _ProfessionalInfo createState() => _ProfessionalInfo();
}
class _ProfessionalInfo extends State<ProfessionalInfo>{

  TextEditingController education = TextEditingController();
  TextEditingController smoke = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController discription = TextEditingController();


  @override
  Widget build(BuildContext context) {
    print(widget.fname+" "+widget.lname+" "+widget.dob+" "+widget.dob_place+"\n"+widget.maritalstatus+" "+widget.gender+" "+widget.m_month+widget.m_year+" "+widget.message+"\n"
        +widget.diet+" "+widget.smoke+" "+widget.drink);

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
                          child: Text("Professional Information",
                            style: TextStyle(
                                fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          margin: EdgeInsets.only(left: 0.05, right: 0.05, bottom: 20,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Aaditya Pankaj",
                                style: TextStyle(
                                    color: Dcolor.appPrimaryColor,
                                    fontSize: 20
                                ),
                              ),
                              Text("(Tell us about yourself so that we can find the most suitable match for you.)",style: TextStyle(fontSize: 17),),
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
                                  controller: education,
                                  decoration: InputDecoration(
                                      hintText: "What's your highest education ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(Icons.keyboard_arrow_down)
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
                                  controller: smoke,
                                  decoration: InputDecoration(
                                      hintText: "Do you smoke ?",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(Icons.keyboard_arrow_down)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05,bottom: 20 ),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: salary,
                                  decoration: InputDecoration(
                                      hintText: "How much your salary per year?(enter in digit only)",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: Icon(Icons.keyboard_arrow_down)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05,bottom: 20),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: size.width * 0.85,
                                child: TextField(
                                  controller: discription,
                                  decoration: InputDecoration(
                                      hintText: "Describe a little bit about you and your family.",
                                      hintStyle: TextStyle(
                                        color: MyColors.grayText,
                                        fontSize: 15,
                                      ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.05, right: 0.05,top: 30),
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: size.width * 0.85,
                                child: FlatButton(
                                  onPressed: (){
                                    _registration();
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
    if (education.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter diet",
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (smoke.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter smoke",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (salary.text== "") {
      Fluttertoast.showToast(
          msg: "Please enter drink",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }else if (discription.text== "") {
      Fluttertoast.showToast(
          msg: "Please enter drink",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }else {
      _UserRegistation();
    }
  }

  _UserRegistation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactInfo()));
  }

}