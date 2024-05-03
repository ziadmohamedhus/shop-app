
import 'package:flutter/material.dart';

import '../MODELS/Button.dart';
import '../MODELS/FormField.dart';
import '../MODELS/product_model.dart';
import '../SERVICES/update_products.dart';

class Update_product_page extends StatelessWidget {
  Update_product_page({required this.product} );
   String? title;
   dynamic? price;
   String? description;
   String? image;
  Product_Model product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update product'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100,),

              TextForm_model(
                color: Colors.black,
                hintText: 'Name',
                onChanged: (data){title=data;},
              ),

              SizedBox(height: 10,),

              TextForm_model(
                color: Colors.black,
                hintText: 'Description',
                onChanged: (data){description=data;},
              ),

              SizedBox(height: 10,),

              TextForm_model(
                color: Colors.black,
                hintText: 'Price',
                onChanged: (data){price=data;},
                textInputType: TextInputType.number,
              ),

              SizedBox(height: 10,),

              TextForm_model(
                color: Colors.black,
                hintText: 'Image',
                onChanged: (data){image=data;},
              ),

              SizedBox(height: 20,),

              CustomButon(
                text: 'Update',
                onTap: ()async{
                  try {
                    await Update_product().update_product(
                        title: title==null?product.title:title!,
                        price: price==null?product.price.toString():price!,
                        description: description==null?product.description:description!,
                        image: image==null?product.image:image!,
                        category: product.category,
                        id: product.id.toString(),
                    );
                  } on Exception catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
