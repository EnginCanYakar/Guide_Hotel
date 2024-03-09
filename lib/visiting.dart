import 'package:flutter/material.dart';

class VisitingPlaces extends StatefulWidget {
  const VisitingPlaces({super.key});

  @override
  State<VisitingPlaces> createState() => _VisitingPlacesState();
}

class _VisitingPlacesState extends State<VisitingPlaces> {
  List<AssetImage> sideImages = [
    const AssetImage("lib/assets/images/side.jpg"),
    const AssetImage("lib/assets/images/tiyatro.jpg"),
  ];
  List<AssetImage> kanyonKopru = [
    const AssetImage("lib/assets/images/koprulu-kanyon-2-1.jpg"),
    const AssetImage(
        "lib/assets/images/koprulu-kanyon_40807294347604148073.jpeg"),
  ];
  int kanImage = 0;

  int sidImage = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: const Text(
            "The Places You Can Visit",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Caveat",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    sidImage++;
                    if (sidImage >= sideImages.length) {
                      sidImage = 0;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ClipRRect(
                      // ClipRRect to clip the image to the rounded corners
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: sideImages[sidImage],
                        fit: BoxFit.cover, // Adjust the fit property as needed
                      ),
                    ),
                  ),
                ),
              ),
              buildTitle('Side Ancient City'),
              const Text(
                '"Press the image to see more pictures"',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Caveat",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 5),
                  child: informationBigi(
                    "The city, which was under Roman rule after 78 BC, became the trade center of the region in the 2nd and 3rd centuries. It was a rich and bright period, especially provided by the slave trade. It was a center of science and culture during the 2nd century.",
                  )),
              const Divider(
                color: Colors.white,
                height: 10,
                thickness: 1,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    kanImage++;
                    if (kanImage >= kanyonKopru.length) {
                      kanImage = 0;
                    }
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ClipRRect(
                      // ClipRRect to clip the image to the rounded corners
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: kanyonKopru[kanImage],
                        fit: BoxFit.cover, // Adjust the fit property as needed
                      ),
                    ),
                  ),
                ),
              ),
              buildTitle(
                "Bridge Canyon",
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, bottom: 10, top: 10),
                child: informationBigi(
                  "Bridge Canyon National Park is a national park in the Manavgat district of Antalya. The park is located between Bolasan and Beşkonak, around the 14 km long, 100 m deep Köprülü Canyon, through which Köprü Stream flows. It is our longest canyon with a length of 14 km.",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding informationBigi(bilgi) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        bilgi,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Title buildTitle(String baslik) {
    return Title(
      color: Colors.white,
      child: Text(
        baslik,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: "Caveat",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
