import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:nepali_vivah/mainscreens/Screen2.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.title,
          style: TextStyle(color: MyColors.whiteColor),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.pinkvariaance,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: MyColors.lightgreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Subscribe",
                      style: TextStyle(color: MyColors.whiteColor),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen2()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: MyColors.pinkvariaance,
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    Strings.heading1,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: MyColors.pinkvariaance,
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/images/user_image.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    Strings.name,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    Strings.address,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: MyColors.whiteColor,
                      ),
                      Text(
                        Strings.location,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        debugPrint("hello");
                      },
                      color: MyColors.pinkvariaance,
                      textColor: MyColors.whiteColor,
                      child: Icon(
                        Icons.favorite,
                        color: MyColors.whiteColor,
                        size: 30,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(Strings.show_intrest,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.grayText)))
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      color: MyColors.lightgreen,
                      textColor: MyColors.whiteColor,
                      child: Icon(
                        Icons.chat_bubble,
                        color: MyColors.whiteColor,
                        size: 30,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(Strings.message,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.grayText)))
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      color: MyColors.grayText,
                      textColor: MyColors.whiteColor,
                      child: Icon(
                        Icons.thumb_down,
                        color: MyColors.whiteColor,
                        size: 30,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(Strings.likes,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.grayText)))
                  ],
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 1,
            color: MyColors.grayText,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: 250.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/images/users.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "Just Joined members(525)",
                    style: TextStyle(
                        color: MyColors.pinkvariaance,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    Strings.heading2,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: MyColors.pinkvariaance,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 142.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(15.0),
                                child: CircleAvatar(
                                  radius: 55.0,
                                  backgroundImage:
                                      AssetImage('assets/images/user.png'),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    Strings.heading3,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: MyColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: MyColors.pinkvariaance,
                  actions: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 200.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: MyColors.whiteColor,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.location_on,
                            size: 80.0, color: MyColors.pinkvariaance),
                        Text(
                          "Location",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 150,
                      width: 1,
                      color: MyColors.grayText,
                    ),
                    Column(
                      children: [
                        Icon(Icons.star,
                            size: 80.0, color: MyColors.pinkvariaance),
                        Text(
                          "Star",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.person,
                            size: 80.0, color: MyColors.pinkvariaance),
                        Text(
                          "My Profile",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 150,
                      color: MyColors.grayText,
                    ),
                    Column(
                      children: [
                        Icon(Icons.search,
                            size: 80.0, color: MyColors.pinkvariaance),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "25",
                          style: TextStyle(
                              fontSize: 60.0, color: MyColors.pinkvariaance),
                        ),
                        Text(
                          "twenty five",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 150,
                      color: MyColors.grayText,
                    ),
                    Column(
                      children: [
                        Text(
                          "21",
                          style: TextStyle(
                              fontSize: 60.0, color: MyColors.pinkvariaance),
                        ),
                        Text(
                          "twenty one",
                          style: TextStyle(
                            color: MyColors.pinkvariaance,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "28",
                            style: TextStyle(
                              fontSize: 60.0,
                              color: MyColors.pinkvariaance,
                            ),
                          ),
                          Text(
                            "twenty eight",
                            style: TextStyle(
                              color: MyColors.pinkvariaance,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 150,
                        color: MyColors.grayText,
                      ),
                      Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                              fontSize: 60.0,
                              color: MyColors.pinkvariaance,
                            ),
                          ),
                          Text(
                            "twelve fiveas",
                            style: TextStyle(
                              color: MyColors.pinkvariaance,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 1,
            color: MyColors.grayText,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_pin,
                      color: MyColors.grayText,
                      size: 60.0,
                    ),
                    Container(
                      height: 50,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: MyColors.grayText,
                      )),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type comment here.",
                          contentPadding: EdgeInsets.only(bottom: 20, left: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.add_photo_alternate,
                      color: MyColors.grayText,
                      size: 50.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: RaisedButton(
                        color: MyColors.pinkvariaance,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Post",
                          style: TextStyle(color: MyColors.whiteColor),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 70,
                  width: size.width,
                  child: ListTile(
                    onTap: () {},
                    // trailing: Text("now Earns RS.2.40.000 per year"),
                    title: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            string.user_name,
                            style: TextStyle(
                                fontSize: 17, color: MyColors.pinkvariaance),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5, left: 5),
                          child: Text(
                            "now Earns RS.2.40.000 per year",
                            style: TextStyle(
                                fontSize: 14, color: MyColors.grayText),
                          ),
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: MyColors.grayText,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 2),
                          child: Text(
                            "2 March 2018",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyColors.blackText,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 1),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: MyColors.grayText,
                              size: 30.0,
                            ),
                            Text("Comment",
                                style: TextStyle(
                                  color: MyColors.blackText,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: MyColors.grayText,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 1,
                      ),
                      child: Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: MyColors.grayText,
                              size: 30.0,
                            ),
                            Text(
                              "Comment(0)",
                              style: TextStyle(
                                color: MyColors.blackText,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: size.width,
                  height: 1,
                  color: MyColors.grayText,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
                    child: Text(
                      "Loading more",
                      style: TextStyle(
                        fontSize: 20,
                        color: MyColors.grayText,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: MyColors.pinkvariaance,
        unselectedItemColor: MyColors.grayText,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("home")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text("serch")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
              ),
              title: Text("chat")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              title: Text("alert")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              title: Text("Menu")),
        ],
      ),
    );
  }
}
