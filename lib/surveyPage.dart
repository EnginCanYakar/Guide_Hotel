import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Satisfaction Form',
      home: HotelSatisfactionForm(),
    );
  }
}

class HotelSatisfactionForm extends StatefulWidget {
  const HotelSatisfactionForm({Key? key}) : super(key: key);

  @override
  HotelSatisfactionFormState createState() => HotelSatisfactionFormState();
}

class HotelSatisfactionFormState extends State<HotelSatisfactionForm> {
  int foodRating = 0;
  int employeeBehaviorRating = 0;
  int spaRating = 0;
  int alaCarteRating = 0;
  int poolRating = 0;
  int roomRating = 0;
  int bedRating = 0;

  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Hotel Satisfaction Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Caveat",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRatingField("Food", foodRating, (value) {
                setState(() {
                  foodRating = value;
                });
              }),
              buildRatingField("Employee Behavior", employeeBehaviorRating,
                  (value) {
                setState(() {
                  employeeBehaviorRating = value;
                });
              }),
              buildRatingField("Spa", spaRating, (value) {
                setState(() {
                  spaRating = value;
                });
              }),
              buildRatingField("À la Carte Restaurants", alaCarteRating,
                  (value) {
                setState(() {
                  alaCarteRating = value;
                });
              }),
              buildRatingField("Pools", poolRating, (value) {
                setState(() {
                  poolRating = value;
                });
              }),
              buildRatingField("Rooms", roomRating, (value) {
                setState(() {
                  roomRating = value;
                });
              }),
              buildRatingField("Beds", bedRating, (value) {
                setState(() {
                  bedRating = value;
                });
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseFirestore.instance
                        .collection('anketler')
                        .add({
                      'foodRating': foodRating,
                      'employeeBehaviorRating': employeeBehaviorRating,
                      'spaRating': spaRating,
                      'alaCarteRating': alaCarteRating,
                      'poolRating': poolRating,
                      'roomRating': roomRating,
                      'bedRating': bedRating,
                      'timestamp': DateTime.now(),
                    });
                    print('Anket verileri başarıyla Firestore\'a gönderildi!');
                    setState(() {
                      submitted = true;
                    });
                    // Bildirimi göstermek için
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Thank you for completing the survey!'),
                        duration:
                            Duration(seconds: 5), // 5 saniye sonra kapanacak
                      ),
                    );
                    // 5 saniye bekledikten sonra anasayfaya geri dönmek için
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    });
                  } catch (error) {
                    print(
                        'Anket verileri gönderilirken bir hata oluştu: $error');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingField(String label, int rating, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Caveat",
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (int i = 1; i <= 5; i++)
              GestureDetector(
                onTap: () => onChanged(i),
                child: Icon(
                  i <= rating ? Icons.star : Icons.star_border,
                  size: 40,
                  color: Colors.black,
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
