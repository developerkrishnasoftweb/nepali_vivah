import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              height: 100,
              width: 100,
              child: Image.asset("assets/images/logoo.png"),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                style: TextStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: size.width * 0.85,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style:
                            TextStyle(color: MyColors.whiteColor, fontSize: 17),
                      ),
                      color: MyColors.pinkvariaance,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
