import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:nepali_vivah/Api_File/services.dart';

class MatchedProfile extends StatefulWidget {
  String profileImage;
  var agestatus;
  List Matched_profile,Userdata;
  MatchedProfile({this.profileImage,this.agestatus,this.Userdata,this.Matched_profile});
  @override
  _MatchedProfileState createState() => _MatchedProfileState();
}

class _MatchedProfileState extends State<MatchedProfile> {
  String interest = "Interest", follow = "Follow", ignore = "Ignore";
  String id, gender;
  List interestedMembers;
  List<AddMatchedProfile> profile = List<AddMatchedProfile>();
  @override
  void initState() {
    memberViewById();
    super.initState();
  }
  Widget interestBtn(memberId, id){
    return FlatButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black45, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text("Interest",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
      onPressed: (){
        FormData formData = FormData.fromMap({
          "id" : id,
          "member_id" : memberId
        });
        Services.interestadd(formData).then((value) {
          if(value.response == 1){
            memberViewById();
          } else {
            print("member_id = " + memberId + "id = " + id);
          }
        });
      },
    );
  }
  Widget notInterestBtn(memberId, id){
    return FlatButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.redAccent, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text("Not Interest",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          color: Colors.redAccent
        ),
      ),
      onPressed: (){
        FormData formData = FormData.fromMap({
          "id" : id,
          "member_id" : memberId
        });
        Services.interestdelete(formData).then((value) {
          if(value.response == 1){
            memberViewById();
          } else {
            print("member_id = " + memberId + "id = " + id);
          }
        });
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _showProfiles(BuildContext context, int index){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  image:NetworkImage(profile[index].image)
                )
              ),
            ),
            Container(
              child: Text(profile[index].firstName + " " + profile[index].lastName,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(profile[index].age + " " + profile[index].status,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 70,
                  height: 30,
                  child: interestedMembers.contains(profile[index].id) ? notInterestBtn(id, profile[index].id) : interestBtn(id, profile[index].id),
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black45, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(follow,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    onPressed: (){
                    },
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black45, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text(ignore,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    onPressed: (){

                    },
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: 200,
      width: size.width,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: profile.length,
        itemBuilder: _showProfiles,
        scrollDirection: Axis.horizontal,
        itemExtent: 230,
      ),
    );
  }

  /*
  * Member view by id
  * */
  void memberViewById() async {
    FormData formData = FormData.fromMap({
      "member_id" : "35"
    });
    await Services.memberViewById(formData).then((value) async {
      if(value.response == 1){
        setState(() {
          id = value.data[0]["member_id"].toString();
          gender = value.data[0]["gender"].toString();
          interestedMembers = value.data[0]["interest"].toString().split(",");
        });
       matchProfile();
      } else {
        print("Something went wrong !!!");
      }
    });
  }

  void matchProfile() async {
    FormData formData = FormData.fromMap({
      "member_id" : id,
      "gender" : gender
    });

    await Services.matched_profile(formData).then((value) {
      if(value.response == 1){
        for(int i = 0; i < value.data.length; i++){
          profile += [(AddMatchedProfile(image: "http://kvms.kriishnacab.com/public/images/Profile/" + value.data[i]["profile_image"].toString(), age: value.data[i]["age"].toString(), firstName: value.data[i]["first_name"].toString(), lastName: value.data[i]["last_name"].toString(), id: value.data[i]["member_id"].toString(), status: value.data[i]["marital_status_id"].toString()))];
        }
      }
    });
  }
}


class AddMatchedProfile{
  final String image, firstName, lastName, age, status, id;
  AddMatchedProfile({this.image, this.firstName, this.lastName, this.status, this.age, this.id});
}