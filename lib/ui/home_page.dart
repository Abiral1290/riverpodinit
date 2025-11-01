import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpodinit/shared_widget/Cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [CardIcon()],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,),
          itemBuilder: (BuildContext, int){
            return ShoppingCard(
              name:"Title",
              voidCallback: (){},
            );
          }),
    );
  }
}
