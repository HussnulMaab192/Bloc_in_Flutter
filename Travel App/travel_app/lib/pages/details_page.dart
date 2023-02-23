import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/discover_nav_pages/main_page.dart';
import 'package:travel_app/pages/widgets/button.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = 0;
  int gottenStars = 4;
  bool tappedOnHeart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 350.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Positioned(
          left: 20.w,
          top: 40.w,
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
        Positioned(
          left: 0.w,
          right: 0.w,
          top: 240.h,
          // Below Container
          child: Container(
            height: 600.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                // 250 dollar (Row)
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(
                          text: "Yousimite",
                          color: AppColors.mainColor,
                          size: 25.sp),
                      SimpleText(
                          text: "\$ 250",
                          color: AppColors.mainTextColor,
                          size: 23.sp),
                    ],
                  ),
                ),

                // Location
                Container(
                  margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SimpleText(
                          text: "USA",
                          color: AppColors.mainTextColor,
                          size: 15.sp),
                      SizedBox(
                        width: 5.w,
                      ),
                      SimpleText(
                          text: "Calenairio",
                          color: AppColors.mainTextColor,
                          size: 15.sp),
                    ],
                  ),
                ),

                //Stares
                Container(
                  margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SimpleText(
                            text: "(4.0)", color: Colors.black54, size: 15.sp)
                      ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // People
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: LargeText(
                          text: "People",
                          color: AppColors.mainColor,
                          size: 25.sp)),
                ),
                SizedBox(
                  height: 7.h,
                ),
                // Number of people in your Group
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: SimpleText(
                          text: "Number of people in your group",
                          color: AppColors.mainTextColor,
                          size: 19.sp)),
                ),
                const SizedBox(
                  height: 15,
                ),
                // boxes 1,2,3,4,5
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      5,
                      (index) => InkWell(
                            onTap: (() {
                              setState(() {
                                selectedIndex = index;
                              });
                            }),
                            child: AppButton(
                              selectedIndex: selectedIndex,
                              index: index,
                              isIcon: false,
                            ),
                          )),
                ),
                // Description Text
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: LargeText(
                        text: "Description",
                        color: AppColors.mainColor,
                        size: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 20.w, top: 10.h, right: 10.w),
                      child: SimpleText(
                          text:
                              "You must go for Traveling .Traveling helps get rid of Pressure.Go To the Mountain to see the nature",
                          color: AppColors.mainTextColor,
                          size: 20.sp)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tappedOnHeart = !tappedOnHeart;
                        });
                      },
                      child: AppButton(
                        isIcon: true,
                        iconData: Icons.favorite_border,
                        tappedOnHeart: !tappedOnHeart,
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const MainPage();
                            },
                          ));
                        },
                        child: ResponsiveButton(width: 220.w)),
                    SizedBox(
                      width: 30.w,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    this.selectedIndex,
    this.index,
    this.isIcon,
    this.iconData,
    this.tappedOnHeart,
  }) : super(key: key);

  int? selectedIndex;
  int? index;
  IconData? iconData;
  bool? tappedOnHeart;
  bool? isIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      height: 50.h,
      width: 55.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mainColor, width: 1),
        color: selectedIndex != null && selectedIndex == index ||
                tappedOnHeart == true
            ? AppColors.mainColor
            : AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: isIcon == true
              ? Icon(iconData,
                  color: tappedOnHeart == true
                      ? Colors.white
                      : AppColors.mainColor)
              : Text(
                  "${index! + 1}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? Colors.white
                          : AppColors.mainColor,
                      fontSize: 22.sp),
                )),
    );
  }
}
