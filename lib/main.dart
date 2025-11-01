
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/model/model.dart';



final helloWorldProvide = Provider((_) => "Hello World");

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

    final String value = ref.watch(helloWorldProvide);
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Test"),),
        body: SizedBox.expand(
          child: Consumer(
            builder: (context, ref, child) {
              final provide = ref.watch(responseJoker);
              return Stack(
                alignment: Alignment.center,
                children: [
                  switch(provide){
              // On error, we display a simple error message.
              AsyncValue(:final value?) => SelectableText(value.setup,
                    textAlign: TextAlign.center,),
                  AsyncValue(error: != null) => const Text("fetch the data"),
                  AsyncValue() => const CircularProgressIndicator(),
                  },
                  Positioned(bottom: 20,child: ElevatedButton(onPressed: (){
                    ref.invalidate(responseJoker);
                  }, child: Text("Click")))
                ],
              );
            }
          ),
        ),
      ),
    );
  }


}