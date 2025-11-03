import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/provide/card_product_provider.dart';
import 'package:riverpodinit/provide/product_provider.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final cardpage = ref.watch(cardProductNotifier);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: cardpage.map((products){
            return Expanded(

              child: Row(
                children: [
                  SizedBox(child: Image(image: AssetImage(products.image!))),
                  SizedBox(height: 10),
                  SizedBox(child: Text(products.name!)),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(products.placeOrder.toString()),)
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
