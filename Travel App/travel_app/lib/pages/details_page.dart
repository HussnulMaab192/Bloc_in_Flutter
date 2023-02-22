import 'package:flutter/material.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        const Positioned(
          left: 20,
          top: 40,
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 300,
          // Below Container
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // 250 dollar (Row)
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      LargeText(
                          text: "Yousimite", color: Colors.black, size: 25),
                      SimpleText(text: "250 \$", color: Colors.black, size: 19),
                    ],
                  ),
                ),

                // Location
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SimpleText(text: "USA", color: Colors.black, size: 15),
                      SizedBox(
                        width: 5,
                      ),
                      SimpleText(
                          text: "Calenairio", color: Colors.black, size: 15),
                    ],
                  ),
                ),

                //Stares
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            4,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.star_border,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const SimpleText(
                            text: "(4.0)", color: Colors.black54, size: 15)
                      ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: LargeText(
                          text: "People", color: Colors.black, size: 25)),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: SimpleText(
                          text: "Number of people in your group",
                          color: Colors.grey,
                          size: 16)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
