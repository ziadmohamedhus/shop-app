import 'package:shop_app/MODELS/product_model.dart';
import 'package:shop_app/SERVICES/post_request.dart';

class Add_product
{
  Future<Product_Model> add_product( {required String title,required  String price,required  String description,required  String image,required  String category}) async
  {
    Map<String,dynamic> Data=await Post_Put().post(
        URL: "https://fakestoreapi.com/products",
        Body: {
          'title':title ,
          'price': price,
          'description':description ,
          'image':image ,
          'category':category ,
        },
        );
    return Product_Model.fromJson(Data);

  }
}