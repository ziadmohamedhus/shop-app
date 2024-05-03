
import 'package:flutter/material.dart';
import 'package:shop_app/MODELS/product_model.dart';

class Card_puilder extends StatelessWidget {
   Card_puilder({required this.product});

  Product_Model product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // NOT CUT THE IMAGE !!!!
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 140,
          width: 220,
          decoration: BoxDecoration(
            boxShadow:
            [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(10, 10),
                spreadRadius: 0,
                blurRadius: 40,
              )
            ],
          ),
          child: Card(
            //for the shadow
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${product.title.substring(0,15)}...',style: TextStyle(color: Colors.grey,fontSize: 16,),),
                  //SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${product.price}',style: TextStyle(fontSize: 16,),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,)),

                    ],)

                ],),
            ),
          ),
        ),
        Positioned(
            right: 25,
            top: -55,
            child: Image.network(product.image,
              height: 100,
              width: 100,

            )
        )
      ],
    );
  }
}
