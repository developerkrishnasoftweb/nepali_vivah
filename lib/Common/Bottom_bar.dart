import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nepali_vivah/mainscreens/chat_home.dart';
import 'package:nepali_vivah/mainscreens/main.dart';
import 'package:nepali_vivah/mainscreens/settings.dart';

class Bottom_bar extends StatefulWidget {
  @override
  _Bottom_barState createState() => _Bottom_barState();
}

class _Bottom_barState extends State<Bottom_bar> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: MyColors.pinkvariaance,
      unselectedItemColor: MyColors.grayText,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
          switch (_index) {
            case 1:
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
              break;
            case 2:
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatHome()));
              break;
            case 4:
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
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
    );
  }
}
