import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("lib/assets/images/novamall.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10))),
              ],
            ),
          ),
        ));
  }
}
