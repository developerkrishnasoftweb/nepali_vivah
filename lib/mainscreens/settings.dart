import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:nepali_vivah/constant/string.dart';
import '../splash.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  var _index = 0;

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                string.titletop,
                style: TextStyle(
                    fontSize: 18,
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
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: MyColors.whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [MyColors.pinkvariaance, MyColors.pinkvariaance],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment(0.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/John.jpg'),
                              radius: 50.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              string.user_name,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 88),
                              child: AppBar(
                                title: Text(
                                  string.settingstabtitle1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                elevation: 0.0,
                                backgroundColor: MyColors.pinkColor,
                                automaticallyImplyLeading: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Account settings",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 1),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Subscription details",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: AppBar(
                    title: Text(
                      string.settingstabtitle2,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    elevation: 0.0,
                    backgroundColor: MyColors.pinkvariaance,
                    automaticallyImplyLeading: false,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, top: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Album",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Intrested in you",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "You interested in",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Photos",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Partner Profile",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: AppBar(
                    title: Text(
                      string.settingstabtitle3,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    elevation: 0.0,
                    backgroundColor: MyColors.pinkvariaance,
                    automaticallyImplyLeading: false,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Careers",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Support",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Terms",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Payment locations",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Become a payment center",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(width: size.width, height: 1, color: Colors.grey),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20, left: 10),
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.pinkvariaance,
        unselectedItemColor: MyColors.grayText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 4,
        onTap: (index) {
          setState(() {
            _index = index;
            switch (_index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
                break;
              case 1:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Splash()));
                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.conciergeBell),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("Home"),
          ),
        ],
      ),
    );
  }
}
