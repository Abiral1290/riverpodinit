import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/model/product.dart';

class AllProductProvider extends Notifier<Set<Product>>{


  @override
  Set<Product> build() {
    // TODO: implement build
    return { };
  }

  void addProduct(Product product){
    product.placeOrder = product.placeOrder! + 1;
      state = {...state, product  };

  }
  void removeProduct(Product product){
    // state.product.placeOrder = product.placeOrder! - 1;
    // if(product.placeOrder! <= 1){
    //   state = state.where((p)=>  p.id == product.id).toSet();
    // }


  }
}

final cardProductNotifier = NotifierProvider<AllProductProvider, Set<Product>>((){
  return AllProductProvider();
});

