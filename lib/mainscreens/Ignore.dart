import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';

class Ignore extends StatefulWidget {
  List IgnoreMember;
  String ProfileImage;
  Ignore({this.IgnoreMember,this.ProfileImage});
  @override
  _IgnoreState createState() => _IgnoreState();
}

class _IgnoreState extends State<Ignore> {

  SharedPreferences prefs;
  String Caste;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                string.titletop,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Text(
                string.titlebottom,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: MyColors.pinkvariaance,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment(0.0, 0.0),
              width: size.width,
              child: Text("Intrested Peoples",
                style: TextStyle(
                    fontSize: 20
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: size.width,
              height: size.height *0.86,
              padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: ListView.builder(
                  itemCount: widget.IgnoreMember.length,
                  itemBuilder: (context, index) {
                    Caste = widget.IgnoreMember[index]["spiritual_and_social_background"] != "" ? jsonDecode(widget.IgnoreMember[index]["spiritual_and_social_background"])[0]["Caste"] : "";
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: size.width * 0.30,
                                height: 120,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(widget.ProfileImage+widget.IgnoreMember[index]["profile_image"]),
                                    )
                                )
                            ),
                            Container(
                                width: size.width *0.45,
                                margin: EdgeInsets.only(left: 16,top: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        widget.IgnoreMember[index]["first_name"]+" "+widget.IgnoreMember[index]["last_name"],
                                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Member_id",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                            Text("Age",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                            Text("Height",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                            Text("Caste",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                            Text("Location",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.IgnoreMember[index]["member_id"].toString(),style: TextStyle(fontSize: 16.0),),
                                            Text(widget.IgnoreMember[index]["age"].toString(),style: TextStyle(fontSize: 16.0),),
                                            Text(widget.IgnoreMember[index]["height"].toString()+" cm",style: TextStyle(fontSize: 16.0),),
                                            Caste == "" ?Text("N/A",style: TextStyle(fontSize: 16.0),):Text(Caste,style: TextStyle(fontSize: 16.0),),
                                            Text(widget.IgnoreMember[index]["location"],style: TextStyle(fontSize: 16.0),),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Divider(color: MyColors.pinkvariaance,thickness: 1,)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
