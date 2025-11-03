import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {



   ShoppingCard({super.key,ImageProvider? image, String? name, this.voidCallback, this.addButton, this.subButton, this.add}): name= name ?? "Unnamed",
         image = image?? const AssetImage('assets/placeholder.png');

   final String name;
   final String? add;
   final ImageProvider image;
   final VoidCallback? addButton;
   final VoidCallback? subButton;
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
              SizedBox(child: Image(image: image)),
              SizedBox(height: 10),
              SizedBox(child: Text(name!)),
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      child: IconButton(onPressed: subButton, icon: Icon(Icons.remove)),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(add!, style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(
                      child: IconButton(onPressed: addButton, icon: Icon(Icons.add)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CardIcon extends StatelessWidget {

  final VoidCallback? buttonIcon;
  const CardIcon({super.key, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: buttonIcon,
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
