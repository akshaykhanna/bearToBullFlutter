
List<Product> productsFromJson(List<dynamic> jsonItem) =>
    List<Product>.from(jsonItem.map((x) => Product.fromJson(x)));

class Product {
  String upc;
  String name;
  String price;
  int commentsCount;
  String image;

  Product({this.upc, this.name, this.price, this.commentsCount, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    upc = json['upc'];
    name = json['name'];
    price = json['price'];
    commentsCount = json['commentsCount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upc'] = this.upc;
    data['name'] = this.name;
    data['price'] = this.price;
    data['commentsCount'] = this.commentsCount;
    data['image'] = this.image;
    return data;
  }
}