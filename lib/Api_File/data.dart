import 'package:nepali_vivah/constant/string.dart';

class Data{
  String response;
  String message;
  List data;
  Data({this.response, this.message, this.data});
  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json[0]['Data'] as List,
      message: json[0]['Message'] as String,
      response: json[0]['Response'] as String,

    );
  }
}