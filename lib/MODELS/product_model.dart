class Product_Model {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final Rating_Model? rating;
  final String category;
  Product_Model(
      {required this.id,
        required this.title,
        required this.category,
        required this.price,
        required this.description,
        required this.image,
        required this.rating});

  factory Product_Model.fromJson(jsonData) {
    return Product_Model(
        id: jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : Rating_Model.fromJson(jsonData['rating']));
  }
}

class Rating_Model {
  final dynamic rate;
  final int count;

  Rating_Model({required this.rate, required this.count});

  factory Rating_Model.fromJson(jsonData) {
    return Rating_Model(rate: jsonData['rate'], count: jsonData['count']);
  }
}


///////////////////////////////////////
