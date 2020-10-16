import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class chat extends StatefulWidget{
  @override
  _chatState createState() => _chatState();
}
class _chatState extends State<chat>{
  @override
  final key = GlobalKey();
  List<Widget> list = List();
  TextEditingController msg = TextEditingController();
  Icon sendIcon = Icon(Icons.mic);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: size.width,
          height: 60,
          color: MyColors.pinkvariaance,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(string.registrationTitleTop,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: size.width * 0.1),
                child: Text(string.registrationTitleBottom,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Dcolor.appPrimaryColor,
        elevation: 0.4,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: size.height,
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: size.width,
                      alignment: Alignment(0.0, 1.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: Text(DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(-1.0, 0.0),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                              margin: EdgeInsets.only(bottom: 5, right: size.width * 0.15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(2)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text("Hello,\n"
                                      "How are you",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Text(DateFormat('h:mm a').format(DateTime.now()).toString(),
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                              margin: EdgeInsets.only(bottom: 5, left: size.width * 0.15),
                              decoration: BoxDecoration(
                                color: Dcolor.appGrayColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(2)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text("fine",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Text(DateFormat('h:mm a').format(DateTime.now()).toString(),
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                              margin: EdgeInsets.only(bottom: 5, left: size.width * 0.15),
                              decoration: BoxDecoration(
                                color: Dcolor.appGrayColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(2)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text("What about you\n"
                                      ":)",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Text(DateFormat('h:mm a').format(DateTime.now()).toString(),
                          style: TextStyle(
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*
          * text area
          * */
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Ink(
                          width: size.width * 0.15,
                          child: IconButton(
                            icon: Icon(Icons.insert_emoticon),
                            color: MyColors.pinkvariaance,
                             splashColor: Colors.transparent,
                            onPressed: (){},
                          ),
                        ),
                        Container(
                          width: size.width * 0.5,
                          child: TextField(
                            controller: msg,
                            decoration: InputDecoration(
                              hintText: string.chatDefaultText,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black38),
                            ),
                            cursorColor: MyColors.pinkvariaance,
                            autofocus: false,
                            cursorRadius: Radius.circular(5),
                            onChanged: (value){
                              setState(() {
                                (value.length > 0) ? sendIcon = Icon(Icons.send) : sendIcon = Icon(Icons.mic);
                              });
                            },
                          ),
                        ),
                        Ink(
                          width: size.width * 0.15,
                          child: IconButton(
                            icon: Icon(Icons.attach_file),
                            color: MyColors.pinkvariaance,
                            splashColor: Colors.transparent,
                            onPressed: (){},
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    // margin: EdgeInsets.only(left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment(1.0, 0.0),
                    child: IconButton(
                      icon: sendIcon,
                      color: MyColors.pinkvariaance,
                      splashColor: Colors.transparent,
                      iconSize: 20,
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                        setState(() {
                          msg.clear();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}