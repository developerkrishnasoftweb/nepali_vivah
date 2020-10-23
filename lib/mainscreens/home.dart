import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nepali_vivah/mainscreens/Screen1.dart';
import 'package:nepali_vivah/mainscreens/chat_home.dart';
import 'package:nepali_vivah/mainscreens/main.dart';
import 'package:nepali_vivah/mainscreens/settings.dart';

class Home extends StatefulWidget {
  Home({this.navbarIndex}) : super();
  final int navbarIndex;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  var _index = 1;
  Icon clear;
  TextEditingController search = TextEditingController();

  Widget build(BuildContext context) {
    (widget.navbarIndex != null) ? _index = widget.navbarIndex : _index = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.pinkvariaance,
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: MyColors.whiteColor,
            ),
            onPressed: () {},
            splashColor: Dcolor.appGrayColor,
          ),
          title: Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.darkpink,
            ),
            child: TextField(
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  width: size.width,
                  child: CarouselSlider(
                    height: 190,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 19 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 600),
                    viewportFraction: 1.0,
                    items: [
                      Container(
                        margin: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/user_image.jpg'),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    "You might be interested in",
                    style: TextStyle(
                      color: MyColors.pinkvariaance,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    width: size.width,
                    height: 210,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Screen1()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: MyColors.whiteColor,
                                  boxShadow: [BoxShadow()]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/user_image.jpg"),
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Nikhil Monga",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: MyColors.pinkvariaance),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "28, Single",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            color: MyColors.blue),
                                        Text(
                                          "Indore, India",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: MyColors.blue),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Screen1()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: MyColors.whiteColor,
                                  boxShadow: [BoxShadow()]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/user_image.jpg"),
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Ankush Sharma",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: MyColors.pinkvariaance),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "34, Single",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: MyColors.blue,
                                        ),
                                        Text(
                                          "Delhi, India",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: MyColors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 110,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/user_image.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  padding: EdgeInsets.only(top: 60, bottom: 20),
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    "Recommended member for you",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        margin: EdgeInsets.only(top: 20, left: 150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/John.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              margin: EdgeInsets.only(top: 20, right: 90),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/John.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 220,
                                    height: 220,
                                    margin: EdgeInsets.only(left: 60),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(300.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/John.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottom_bar(currentIndex: 1,));
  }
}
