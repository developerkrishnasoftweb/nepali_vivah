import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nepali_vivah/Common/Appbar.dart';
import 'package:nepali_vivah/Common/Bottom_bar.dart';
import 'package:nepali_vivah/constant/string.dart';
import 'package:nepali_vivah/login_registration/contactinfo.dart';
import 'package:nepali_vivah/login_registration/lifestyle.dart';
import 'package:nepali_vivah/login_registration/partner.dart';
import 'package:nepali_vivah/login_registration/personalinfo.dart';
import 'package:nepali_vivah/login_registration/professionalinfo.dart';
import 'package:nepali_vivah/login_registration/registration.dart';
import 'package:nepali_vivah/login_registration/upload_photo.dart';
import 'package:nepali_vivah/login_registration/username.dart';
import 'package:nepali_vivah/mainscreens/Screen1.dart';
import 'package:nepali_vivah/mainscreens/Screen2.dart';
import 'package:nepali_vivah/mainscreens/chat.dart';
import 'package:nepali_vivah/mainscreens/chat_home.dart';
import 'package:nepali_vivah/mainscreens/home.dart';
import 'package:nepali_vivah/mainscreens/main.dart';
import 'package:nepali_vivah/splash.dart';

import 'mainscreens/settings.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: string.title,
      theme: ThemeData(
        primaryColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Philosopher',

      ),
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}