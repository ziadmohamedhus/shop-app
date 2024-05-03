import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Post_Put
{

  //   POST  =>  SEND DATA

  Future<dynamic> post({required String URL , @required dynamic Body, @required String? Token}) async
  {

    //TO CHECK IF THERE ARE TOKEN TO POST
    Map<String,String>headers={};
    if(Token!=null)
      {
        headers.addAll({'Authorization':'Bearer $Token'});
      }

    http.Response response=await http.post(
        Uri.parse(URL),
        body: Body,
        headers: headers
    );
    print(response.body);
    if (response.statusCode==200) {
      Map<String,dynamic>Data=jsonDecode(response.body);
      return Data;
    }else{ throw Exception("THERE IS AN Exception ${response.statusCode} With body ${response.body}");}
  }

  //   PUT   =>  UPDATE

  Future<dynamic> put({required String URL , @required dynamic Body, @required String? Token}) async
  {

    //TO CHECK IF THERE ARE TOKEN TO POST
    Map<String,String>headers={};
    // add the content type as a header
    headers.addAll({'Content-Type':'application/x-www-form-urlencoded'});
    if(Token!=null)
    {
      headers.addAll({'Authorization':'Bearer $Token'});
    }

    http.Response response=await http.put(
        Uri.parse(URL),
        body: Body,
        headers: headers
    );
    print(response.body);
    if (response.statusCode==200) {
      Map<String,dynamic>Data=jsonDecode(response.body);
      return Data;
    }else{ throw Exception("THERE IS AN Exception ${response.statusCode} With body ${response.body}");}
  }

}