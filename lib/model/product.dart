class Product{

  int? id;
  String? name;
  String? image;
  int? price;
  int? placeOrder;


  Product({this.id, this.name, this.image, this.price, int? placeOrder}): placeOrder = placeOrder ?? 0;



}