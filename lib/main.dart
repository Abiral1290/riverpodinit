
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/ui/home_page.dart';




void main() {
  runApp(
    ProviderScope(
        child:MyApp()
    )
  );
}

class MyApp extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // TODO: implement build
    return MaterialApp(
      home: HomePage()
    );
  }


}