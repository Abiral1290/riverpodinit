import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {



   ShoppingCard({super.key,ImageProvider? image, String? name, this.voidCallback}): name= name ?? "Unnamed",
         image = image?? const AssetImage('assets/placeholder.png');

   final String name;
   final ImageProvider image;
   final VoidCallback? voidCallback;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: 50,
        height: 50,
        child: Padding(padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              SizedBox(child: Text(name!)),
              SizedBox(height: 10),
              SizedBox(child: Image(image: image))
            ],
          ),
        ),
      ),
    );
  }
}


class CardIcon extends StatelessWidget {
  const CardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){},
            icon: Icon(Icons.shopping_bag_outlined)),
        Positioned(
            top: 5,
            left: 5,
            child: Container(
              height: 18,
              width: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
            ))
      ],
    );
  }
}
