import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/mainscreens/chat.dart';
import 'package:nepali_vivah/mainscreens/home.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHome createState() => _ChatHome();
}

class _ChatHome extends State<ChatHome> {
  @override
  var _index = 2;
  Icon clear;
  TextEditingController search = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 250,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/user_image.jpg"),
                fit: BoxFit.fill,
              )),
            ),
            actions: <Widget>[
              Container(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.15,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => chat()));
                        },
                        child: Icon(
                          Icons.chat,
                          color: Dcolor.appPrimaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: Dcolor.appPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
            scrollable: true,
            contentPadding: EdgeInsets.all(0.0),
            insetPadding: EdgeInsets.all(0),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Dcolor.appPrimaryColor,
          title: Container(
            width: size.width,
            height: 60,
            color: Dcolor.appPrimaryColor,
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
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.83,
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 75,
                          width: size.width,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chat()));
                            },
                            title: Text(
                              "Nikhil Monga",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            subtitle:
                                Text("Hello", style: TextStyle(fontSize: 15.0)),
                            trailing: Text(
                              "21 hr ago",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15.0),
                            ),
                            leading: GestureDetector(
                              onTap: () {
                                _showMyDialog();
                              },
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/user_image.jpg"),
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottom_bar(currentIndex: 2,));
  }
}
