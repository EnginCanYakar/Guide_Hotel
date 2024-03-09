
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "About Us",
            style: TextStyle(
                fontFamily: "Caveat",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      """             As a Selectum family, we are developing in a growing structure and constantly improving our hospitality and accommodation services. We have made it our mission to make our guests permanently happy, not just with temporary emotions.

            Thanks to our guests who prefer us every year, we combine the comfortable holiday understanding we offer in our hotels with the comfort of a family.

            We offer our guests of all ages many alternative concepts where they can be themselves. Our versatility is one of our hallmarks in the industry. At the same time, the Selectum brand stands for exclusive quality. We continue to develop our brand so that you feel comfortable and privileged with us.

            And our mission to take confident steps towards a healthy future is a very special one. We have started this journey to leave kindness and smiles to the future entrusted to us. If we structure our respect and love for our nature of future generations, we can truly exist.

            These are the main characteristics of Selectum Hotels & Resort's existence.

            It is our pleasure to welcome you to our resort, which is the closest to you.""",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Caveat",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
