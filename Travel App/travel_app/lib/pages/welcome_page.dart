// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/widgets/button.dart';
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
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LargeText(
                        text: "Trips", color: Colors.black, size: 30),
                    const SizedBox(
                      height: 10,
                    ),
                    const SimpleText(
                        text: "Mountain", color: Colors.black87, size: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: SimpleText(
                        text:
                            "Mountain Hikes Gives you an Incredible Sence of Freedom along with endurance test",
                        color: AppColors.textColor2,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const ResponsiveButton(
                        width: 100,
                      ),
                    )
                  ],
                ),
                Column(
                  children: List.generate(
                    3,
                    (indexOfDots) => Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      height: index == indexOfDots ? 35 : 16,
                      width: 8,
                      decoration: BoxDecoration(
                        color: index == indexOfDots
                            ? AppColors.mainColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
