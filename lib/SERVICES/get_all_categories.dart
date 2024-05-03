import 'dart:convert';

import 'package:http/http.dart' as http;
class Get_all_categories
{
  Future<List> get_all_cotegories() async
  {
    http.Response response=await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    //خلي بالك الي بيرجع من ال api هو List<dynamic> او Map<String,dynamic>
    //====================================================================================================

    //TO CHECK IF API WORK GOOD !!! 200=success  ,  400=client ERROR  ,  500=server ERROR
    if (response.statusCode==200) {
      List<dynamic> Data=jsonDecode(response.body);


      return Data;
    }else{
      throw Exception("THERE IS AN Exception ${response.statusCode}");
    }

  }
}