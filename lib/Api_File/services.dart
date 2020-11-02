import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepali_vivah/constant/colors.dart';
import 'Url.dart';
import 'data.dart';
import 'package:http/http.dart' as http;

Dio dio = new Dio();

class Services {
  static Future<Data> MemberView() async {
    String url = Urls.baseUrl + Urls.memberView;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        data.data = jsonResponse["Data"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> MemberSignIn(body) async {
    String url = Urls.baseUrl + Urls.login_url;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      print(url);
      print(response.data.toString());
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse['Response'];
        data.data = [
          {"member_id": jsonResponse["Data"].toString()}
        ];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> MemberSignUp(body) async {
    String url = Urls.baseUrl + Urls.registration_url;
    dio.options.contentType = Headers.jsonContentType;
    try {
      final Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data(message: 'No Data', response: "1");
        final jsonResponse = response.data;
        data.message = jsonResponse['Message'];
        data.response = jsonResponse['Response'].toString();
        data.data = jsonResponse['Data'];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } catch (e) {
      print("Member Registration Error : " + e.toString());
      throw Exception("Something went wrong");
    }
  }

  static Future<Data> memberViewById(body) async {
    String url = Urls.baseUrl + Urls.memberViewId;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse['Response'];
        List list = [];
        list = [
          /// Todo API path copy to here all data
          {
            "member_id": jsonResponse['Data'][0]["member_id"],
            "mahasangh_id": jsonResponse['Data'][0]["mahasangh_id"],
            "member_profile_id": jsonResponse['Data'][0]["member_profile_id"],
            "first_name": jsonResponse['Data'][0]['first_name'],
            "last_name": jsonResponse['Data'][0]['last_name'],
            "gender": jsonResponse['Data'][0]['gender'],
            "email": jsonResponse['Data'][0]['email'],
            "username": jsonResponse['Data'][0]['username'],
            "mobile": jsonResponse['Data'][0]['mobile'],
            "age": jsonResponse['Data'][0]['age'],
            "height": jsonResponse['Data'][0]['height'],
            "profile_image": jsonResponse['Data'][0]['profile_image'],
            "marital_status_id": jsonResponse['Data'][0]['marital_status_id'],
            "password": jsonResponse['Data'][0]['password'],
            "rashi_match": jsonResponse['Data'][0]['rashi_match'],
            "rashi": jsonResponse['Data'][0]['rashi'],
            "horoscope": jsonResponse['Data'][0]['horoscope'],
            "gotra": jsonResponse['Data'][0]['gotra'],
            "salary": jsonResponse['Data'][0]['salary'],
            "location": jsonResponse['Data'][0]['location'],
            "education": jsonResponse['Data'][0]['education'],
            "lang": jsonResponse['Data'][0]['lang'],
            "occupation": jsonResponse['Data'][0]['occupation'],
            "address": jsonResponse['Data'][0]['address'],
            "number_of_children": jsonResponse['Data'][0]['number_of_children'],
            "on_behalf_id": jsonResponse['Data'][0]['on_behalf_id'],
            "is_closed": jsonResponse['Data'][0]['is_closed'],
            "date_of_birth": jsonResponse['Data'][0]['date_of_birth'],
            "adhar_card": jsonResponse['Data'][0]['adhar_card'],
            "family_id": jsonResponse['Data'][0]['family_id'],
            "introduction": jsonResponse['Data'][0]['introduction'],
            "basic_info": jsonResponse['Data'][0]['basic_info'],
            "education_and_career": jsonResponse['Data'][0]
                ['education_and_career'],
            "physical_attributes": jsonResponse['Data'][0]
                ['physical_attributes'],
            "language": jsonResponse['Data'][0]['language'],
            "hobbies_and_interest": jsonResponse['Data'][0]
                ['hobbies_and_interest'],
            "residency_information": jsonResponse['Data'][0]
                ['residency_information'],
            "spiritual_and_social_background": jsonResponse['Data'][0]
                ['spiritual_and_social_background'],
            "life_style": jsonResponse['Data'][0]['life_style'],
            "astronomic_information": jsonResponse['Data'][0]
                ['astronomic_information'],
            "family_info": jsonResponse['Data'][0]['family_info'],
            "additional_personal_details": jsonResponse['Data'][0]
                ['additional_personal_details'],
            "partner_expectation": jsonResponse['Data'][0]
                ['partner_expectation'],
            "interest": jsonResponse['Data'][0]['interest'],
            "short_list": jsonResponse['Data'][0]['short_list'],
            "followed": jsonResponse['Data'][0]['followed'],
            "followers": jsonResponse['Data'][0]['followers'],
            "ignored": jsonResponse['Data'][0]['ignored'],
            "ignored_by": jsonResponse['Data'][0]['ignored_by'],
            "gallery": jsonResponse['Data'][0]['gallery'],
            "happy_story": jsonResponse['Data'][0]['happy_story'],
            "package_info": jsonResponse['Data'][0]['package_info'],
            "payments_info": jsonResponse['Data'][0]['payments_info'],
            "interested_by": jsonResponse['Data'][0]['interested_by'],
            "follower": jsonResponse['Data'][0]['follower'],
            "membership": jsonResponse['Data'][0]['membership'],
            "notifications": jsonResponse['Data'][0]['notifications'],
            "profile_status": jsonResponse['Data'][0]['profile_status'],
            "member_since": jsonResponse['Data'][0]['member_since'],
            "express_interest": jsonResponse['Data'][0]['express_interest'],
            "direct_messages": jsonResponse['Data'][0]['direct_messages'],
            "photo_gallery": jsonResponse['Data'][0]['photo_gallery'],
            "profile_completion": jsonResponse['Data'][0]['profile_completion'],
            "is_blocked": jsonResponse['Data'][0]['is_blocked'],
            "privacy_status": jsonResponse['Data'][0]['privacy_status'],
            "pic_privacy": jsonResponse['Data'][0]['pic_privacy'],
            "report_profile": jsonResponse['Data'][0]['report_profile'],
            "reported_by": jsonResponse['Data'][0]['reported_by'],
            "created_at": jsonResponse['Data'][0]['created_at'],
            "updated_at": jsonResponse['Data'][0]['updated_at'],
            "status": jsonResponse['Data'][0]['status'],
          }
        ];
        data.data = list;
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> memberProfileUpdate(body) async {
    String url = Urls.baseUrl + Urls.profileUpdate;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse['Response'].toString();
        data.data = [
          {"profile_image": jsonResponse["Data"].toString()}
        ];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> memberChangePassword(body) async {
    String url = Urls.baseUrl + Urls.ChangePassword;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse['Response'].toString();
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> Advertisements() async {
    String url = Urls.baseUrl + Urls.Advertisement_add;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"].toString();
        List list;
        list = [
          {
            "advertisement_id" : jsonResponse["Data"]["advertisement_id"],
            "title" : jsonResponse["Data"]["title"],
            "top_advertisement" : jsonResponse["Data"]["top_advertisement"],
            "bottom_advertisement" : jsonResponse["Data"]["bottom_advertisement"],
            "middle_advertisement" : jsonResponse["Data"]["middle_advertisement"],
            "vertical_advertisement" : jsonResponse["Data"]["vertical_advertisement"],
            "inserted_at" : jsonResponse["Data"]["inserted_at"],
            "updated_at" : jsonResponse["Data"]["updated_at"],
            "position" : jsonResponse["Data"]["position"],
          }
        ];
        data.data = list;
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }


  static Future<Data> followadd(body) async {
    String url = Urls.baseUrl + Urls.followers_add;
    dio.options.contentType = Headers.jsonContentType;
    try {

      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }
  static Future<Data> followdelete(body) async {
    String url = Urls.baseUrl + Urls.follow_delete;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }



  static Future<Data> interestadd(body) async {
    String url = Urls.baseUrl + Urls.interest_add;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }
  static Future<Data> interestdelete(body) async {
    String url = Urls.baseUrl + Urls.interest_delete;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }



  static Future<Data> ignoreadd(body) async {
    String url = Urls.baseUrl + Urls.ignore_add;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }
  static Future<Data> ignoredelete(body) async {
    String url = Urls.baseUrl + Urls.ignore_delete;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }




  static Future<Data> matched_profile(body) async {
    String url = Urls.baseUrl + Urls.match_profile;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url,data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        data.data = jsonResponse["Data"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> intrestedMemberView(body) async {
    String url = Urls.baseUrl + Urls.intrestedmember;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url,data: body);
      if (response.statusCode == 200) {
        Data data = new Data();

        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        data.data = jsonResponse["Data"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> ignoreMemberView(body) async {
    String url = Urls.baseUrl + Urls.ignoremember;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url,data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        data.data = jsonResponse["Data"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }

  static Future<Data> searchMember(body) async {
    String url = Urls.baseUrl + Urls.searchmember;
    dio.options.contentType = Headers.jsonContentType;
    try {
      Response response = await dio.post(url,data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse["Response"];
        data.data = jsonResponse["Data"];
        return data;
      } else {
        throw Exception("Something went Wrong");
      }
    } on Exception catch (e) {
      print(e.toString);
    }
  }
}
