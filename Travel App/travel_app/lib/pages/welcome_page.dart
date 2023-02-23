// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/discover_nav_pages/main_page.dart';
import 'package:travel_app/pages/widgets/button.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

List images = [
  "p3.jpg",
  "p4.jfif",
  "p2.jpg",
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
            margin: EdgeInsets.only(top: 150.h, left: 20.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(text: "Trips", color: Colors.black, size: 30.sp),
                    SizedBox(
                      height: 10.h,
                    ),
                    SimpleText(
                        text: "Mountain", color: Colors.black87, size: 20.sp),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: SimpleText(
                        text:
                            "Mountain Hikes Gives you an Incredible Sence of Freedom along with endurance test",
                        color: AppColors.mainTextColor,
                        size: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                        );
                      },
                      child: ResponsiveButton(
                        width: 100.w,
                      ),
                    )
                  ],
                ),
                Column(
                  children: List.generate(
                    3,
                    (indexOfDots) => Container(
                      margin: EdgeInsets.only(bottom: 2.h),
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
