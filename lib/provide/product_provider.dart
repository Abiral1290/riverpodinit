

 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/model/product.dart';

 List<Product> products = [
  Product(id: 1, name: "Mens Shoes Van", image: "", price: 2300),
  Product(id: 2, name: "Mens Shoes Van", image: "", price: 4000),
  Product(id: 3, name: "Mens Shoes Van", image: "", price: 6000),
  Product(id: 4, name: "Mens Shoes Van", image: "", price: 5600),
  Product(id: 5, name: "Mens Shoes Van", image: "", price: 7000)
 ];

 final productProvider = Provider((ref) {
   return products;
 });

 final reducedProvide = Provider((ref) {
   return products.where((i) => i.price! > 40000).toList();
 });

