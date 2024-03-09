import 'package:flutter/material.dart';

class OpeningHours extends StatelessWidget {
  const OpeningHours({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "The Times of Events",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Caveat",
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              OpeningHoursItem(
                imagePath: "lib/assets/images/restaurant 125747.png",
                title: "Times of The Restaurants",
                schedule: [
                  "Breakfast: 06:00 - 11:00",
                  "Lunch: 12:00 - 14:00",
                  "Dinner: 18:00 - 21:00",
                ],
              ),
              Divider(color: Colors.white, thickness: 0.5, height: 5),
              OpeningHoursItem(
                imagePath: "lib/assets/images/outsidePool.png",
                title: "Times of Outside Pool",
                schedule: ["08:00 - 18:00"],
              ),
              Divider(color: Colors.white, thickness: 0.5, height: 5),
              OpeningHoursItem(
                imagePath: "lib/assets/images/indoorPool.png",
                title: "Times of Indoor Pool",
                schedule: ["08:00 - 19:00"],
              ),
              Divider(color: Colors.white, thickness: 0.5, height: 5),
              OpeningHoursItem(
                imagePath: "lib/assets/images/gym.png",
                title: "Times of GYM",
                schedule: ["08:00 - 23:00"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpeningHoursItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final List<String> schedule;

  const OpeningHoursItem({
    required this.imagePath,
    required this.title,
    required this.schedule,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Caveat",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 5),
        ...schedule.map((time) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Caveat",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )),
      ],
    );
  }
}
