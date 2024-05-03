import 'package:shop_app/MODELS/product_model.dart';
import 'package:shop_app/SERVICES/post_request.dart';

class Update_product
{
  Future<Product_Model> update_product( {required String title,required  String price,required  String description,required  String image,required  String category,required String id}) async
  {
    Map<String,dynamic> Data=await Post_Put().put(
      URL: "https://fakestoreapi.com/products/$id",
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