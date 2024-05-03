
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/MODELS/product_model.dart';
import 'package:shop_app/SCREENS/update_product.dart';
import 'package:shop_app/SERVICES/get_all_products.dart';
import 'package:shop_app/WIDGETS/card_puilder.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Trending',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartPlus)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10,top: 65),
        child: FutureBuilder<List<Product_Model>>(
          future: Get_all_products().get_all_products(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
              print('true');
            else print('false');




              if (snapshot.hasData) {

                List<Product_Model> products=snapshot.data!;

                return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // SPACE BETWEEN V&H طول وعرض المسافة بي المنتجات
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 35,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context,index)=>GestureDetector(
                      onLongPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Update_product_page(product: products[index] ,)));},
                        child: Card_puilder( product: products[index],
                        )
                    ),
                );
              }else{return Center(child: CircularProgressIndicator());}


          },
        ),
      ),
    );
  }
}
