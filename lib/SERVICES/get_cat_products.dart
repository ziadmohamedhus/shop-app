import '../MODELS/product_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
class Get_Cat_Products
{
  Future<List<Product_Model>> get_cat_products(String category_name) async
  {
    http.Response response=await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category_name'));
    //خلي بالك الي بيرجع من ال api هو List<dynamic> او Map<String,dynamic>
    //====================================================================================================

    //TO CHECK IF API WORK GOOD !!! 200=success  ,  400=client ERROR  ,  500=server ERROR
    if (response.statusCode==200) {
      List<dynamic> Data=jsonDecode(response.body);


      List<Product_Model>product_list=[];


      for(int i=0;i<Data.length;i++)
      {
        product_list.add(Product_Model.fromJson(Data[i]));
      }

      return product_list;
    }else{
      throw Exception("THERE IS AN Exception ${response.statusCode}");
    }
  }
}