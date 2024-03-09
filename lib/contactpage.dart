import 'package:flutter/material.dart';

import 'main.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Contact Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Caveat",
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "lib/assets/images/contact us .png",
              fit: BoxFit.cover,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContactInfoRow(
                      icon: Icons.location_on,
                      text: "Antlaya/Manavgat",
                    ),
                    SizedBox(height: 20),
                    ContactInfoRow(
                      icon: Icons.call,
                      text: "+90 (212) 722 42 00",
                    ),
                    SizedBox(height: 20),
                    ContactInfoRow(
                      icon: Icons.mail,
                      text: "info@selectumhotels.com",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Caveat",
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
