import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodinit/provide/card_product_provider.dart';
import 'package:riverpodinit/provide/product_provider.dart';
import 'package:riverpodinit/shared_widget/Cards.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allproduct = ref.watch(productProvider);
    final cardProvider = ref.watch(cardProductNotifier);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [CardIcon(buttonIcon: (){context.push("/cardPage");},)],
      ),
      body: GridView.builder(
        itemCount: allproduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
          itemBuilder: (BuildContext, index){ 
            return ShoppingCard(
              name: allproduct[index].name,
              image: AssetImage(allproduct[index].image!),
              voidCallback: (){},
              add: allproduct[index].placeOrder.toString(),
              addButton: () => ref.read(cardProductNotifier.notifier).addProduct(allproduct[index]),
              subButton: () => ref.read(cardProductNotifier.notifier).removeProduct(allproduct[index]),
            );
          }),
    );
  }
}
