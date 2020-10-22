import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'Url.dart';
import 'data.dart';
import 'package:http/http.dart' as http;

Dio dio = new Dio();


class Services {
  static Future<Data> userSignIn(body) async {
    String url = Urls.baseUrl + Urls.memberView;
    dio.options.contentType = Headers.jsonContentType;
    try {
      final response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data();
        final jsonResponse = response.data;
        data.message = jsonResponse["Message"];
        data.response = jsonResponse['Response'];
        List list;
        list = [
          /// Todo API path copy to here all data
          {
            "member_id": jsonResponse['Data'][0]["id"],
            "mahasangh_id": jsonResponse['Data'][0]["first_name"],
            "member_profile_id": jsonResponse['Data'][0]["model_name"],
            "first_name": jsonResponse['Data'][0]['email'],
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

            ///TODO : There are more properties to check once
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

  static Future<Data> MemberSignUp(body) async {
    String url = Urls.baseUrl + Urls.registration_url;
    dio.options.contentType = Headers.jsonContentType;
    print(url);
    try {
      final Response response = await dio.post(url, data: body);
      if (response.statusCode == 200) {
        Data data = new Data(message: 'No Data',response: "1");
        final jsonResponse = response.data;
        data.message = jsonResponse['Message'];
        data.response = jsonResponse['Response'].toString();
        print(jsonResponse['Data']);
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

}
