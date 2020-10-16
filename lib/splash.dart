import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nepali_vivah/login_registration/registration.dart';
import 'constant/colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List splashScreen = [
    {"icon" : Icons.search, "title" : "जीवन साथी खोज्नुहोस्", "subtitle" : "Lorem Ipum छापाई  और  अक़षर योजन उदयोंग का\nएक साधारण डमी पाठ है",},
    {"icon" : Icons.people, "title" : "एकअरकालाइ जाननूहोस", "subtitle" : "Lorem Ipum छापाई  और  अक़षर योजन उदयोंग का\nएक साधारण डमी पाठ है",},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            child: Swiper(

              itemBuilder: (BuildContext context, int index) {

                return Container(
                  child: Column(
                    children: [
                      Container(
                        child: Icon(splashScreen[index]["icon"],size: 100,color: Colors.deepOrange,),
                      ),
                      Container(
                        child: Text(splashScreen[index]["title"],style: TextStyle(fontSize: 24,color: Colors.deepOrange),),
                      ),

                      Container(
                        child: Text(splashScreen[index]["subtitle"],textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.black54),),
                      )
                    ],
                  ),
                );
              },
              itemCount: splashScreen.length,
              pagination:
                  new SwiperPagination(alignment: Alignment.bottomCenter,
                    builder: new DotSwiperPaginationBuilder(
                        color: Colors.grey, activeColor: appPrimaryMaterialColorOrange[0xFFE65100]),

                  ),


            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Registration()));
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Text(
          "Skip",
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
