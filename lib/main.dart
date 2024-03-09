import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_guide/firebase_options.dart';
import 'package:hotel_guide/seocndPage.dart';
import 'package:hotel_guide/shoping.dart';
import 'package:hotel_guide/surveyPage.dart';
import 'package:hotel_guide/visiting.dart';

import 'aboutus.dart';
import 'contactpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  )); // Wrap with MaterialApp
}

class HomePage extends StatelessWidget {
  final List<String> openingHoursPaths = [
    "lib/assets/images/restaurant 125747.png",
    "lib/assets/images/indoorPool.png",
    "lib/assets/images/outsidePool.png",
    "lib/assets/images/gym.png",
    // Add other image paths for opening hours
  ];

  final List<String> visitingPaths = [
    "lib/assets/images/side.jpg",
    "lib/assets/images/koprulu-kanyon-2-1.jpg",
    "lib/assets/images/koprulu-kanyon_40807294347604148073.jpeg",
    "lib/assets/images/manavgat_nehri.jpg",
    "lib/assets/images/manavgat_selalesi_genel_gorunus.jpg",
    "lib/assets/images/tiyatro.jpg",
    // Add other image paths for visiting places
  ];

  final List<String> shoppingPaths = [
    "lib/assets/images/novamall.jpg",
    "lib/assets/images/antik-side-carsi-ici.jpg",
    "lib/assets/images/kapalıcarsı.webp",
    // Add other image paths for shopping centers
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/images/selectumfortwo.png",
                    ),
                  ),
                ),
                child: null,
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {
                  // Handle 'Notifications' button tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment),
                title: const Text('Survey'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SurveyPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUs(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Feedback'),
                onTap: () {
                  // Handle 'Feedback' button tap
                },
              ),
              const Divider(),
              const ListTile(
                title: Text('Follow Us'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    onPressed: () {
                      // Handle Facebook button tap
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          shadowColor: Colors.white,
          title: const Text(
            "Your Guide",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Caveat",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImagePageView(
                context,
                openingHoursPaths,
                [
                  "Opening Hours of Restaurant",
                  "Opening Hours of Indoor Pool",
                  "Opening Hours of Outside Pool",
                  "Opening Hours of GYM"
                ], // Labels for opening hours
              ),
              _buildImagePageView(
                context,
                visitingPaths,
                [
                  "Side Ancient City",
                  "Bridge Canyon",
                  "Bridge Canyon",
                  "Manavgat River",
                  "Manavgat Waterfall",
                  "Side Ancient Theater"
                ], // Labels for visiting places
              ),
              _buildImagePageView(
                context,
                shoppingPaths,
                [
                  "Nova Mall",
                  "Side Bazaar",
                  "Grand Bazaar"
                ], // Labels for shopping centers
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePageView(
      BuildContext context, List<String> paths, List<String> labels) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: paths.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (paths == openingHoursPaths) {
                        return const OpeningHours();
                      } else if (paths == visitingPaths) {
                        return const VisitingPlaces();
                      } else if (paths == shoppingPaths) {
                        return const ShoppingPage();
                        // Handle navigation for shopping centers
                      }
                      // Return an empty container for other cases
                      return Container();
                    },
                  ),
                );
              },
              child: Container(
                height: 200,
                width: 400,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(paths[index]),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        labels[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;

  const SocialIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        iconPath,
        height: 50,
        width: 50,
      ),
    );
  }
}
