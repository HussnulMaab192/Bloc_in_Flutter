// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

List images = [
  "welcome-one.png",
  "welcome-two.png",
  "welcome-three.png",
];

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "img/" + images[index],
              ),
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 130, right: 20),
                    child: Column(
                      children: const [
                        LargeText(text: "Trips", color: Colors.black, size: 25),
                        SimpleText(
                            text: "Mountain", color: Colors.grey, size: 18),
                        SimpleText(
                            text:
                                "Hi Here is the Simple Text. This Text is just\n displaying and showing simple Layout",
                            color: Colors.grey,
                            size: 13),
                        SimpleText(
                            text:
                                "Texts which is just to be display the sample of\n texts and some thing which looks a bit great ",
                            color: Colors.grey,
                            size: 13),
                      ],
                    ),
                  )
                ],
              ),
              Column()
            ],
          ),
        ),
      ),
    );
  }
}
