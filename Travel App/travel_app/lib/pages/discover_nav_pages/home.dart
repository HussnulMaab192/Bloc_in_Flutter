import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/cubits/app_states.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Map myListOfCat = {
    "kayaking.webp": "KayaKing",
    "snorkling.webp": "snorkling",
    "balloning.webp": "balloning",
    "hiking.webp": "hiking",
  };

  List places = [
    "p1.jpg",
    "p2.jpg",
    "p3.jpg",
    "p4.jfif",
  ];
  List inspirations = [
    "i1.jpg",
    "i2.jpg",
    "i3.jpg",
    "i4.jpg",
    "i5.jfif",
  ];
  List emotions = [
    "e1.jpeg",
    "e2.jpg",
    "e3.jfif",
    "e4.jfif",
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            if (state is Loadedstate) {
              var info = state.places;
              return Column(
                children: [
                  //ROW/
                  Container(
                    margin: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30.sp,
                          color: Colors.black54,
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("img/kayaking.webp"))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: LargeText(
                          text: "Discover", color: Colors.black, size: 25.sp),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.only(left: 20.w, right: 20.w),
                        isScrollable: true,
                        controller: tabController,
                        tabs: const [
                          Tab(text: "Places"),
                          Tab(text: "Inspiration"),
                          Tab(text: "Emotions"),
                        ]),
                  ),
                  // Tab Views // Pictures of Collections
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DetailsPage();
                        },
                      ));
                    },
                    child: SizedBox(
                      height: 300.h,
                      width: double.maxFinite,
                      child: TabBarView(controller: tabController, children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(
                                left: 7.w, top: 10.h, right: 10.w),
                            height: 280.h,
                            width: 180.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              // child: CachedNetworkImage(
                              //     placeholder: (context, url) {
                              //       return Center(
                              //         child: Image.asset(
                              //           "img/loading.gif",
                              //           fit: BoxFit.cover,
                              //         ),
                              //       );
                              //     },
                              //     imageUrl:
                              //         "http://mark.bslmeiyu.com/uploads/${info[index].img!}")

                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: const Image(
                                  image: AssetImage("img/loading.gif"),
                                  fit: BoxFit.contain,
                                ).image,
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${info[index].img!}'),
                              ),
                            ),
                          ),
                        ),

                        // customBuilder(
                        //     length: places.length, collection: places),
                        customBuilder(
                            length: inspirations.length,
                            collection: inspirations),
                        customBuilder(
                            length: emotions.length, collection: emotions),
                      ]),
                    ),
                  ),
                  // Explore More
                  Container(
                    margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                    child: Row(
                      children: [
                        SimpleText(
                            text: "Explore More",
                            color: Colors.black,
                            size: 19.sp),
                        Expanded(child: Container()),
                        SimpleText(
                            text: "See All", color: Colors.blue, size: 17.sp),
                      ],
                    ),
                  ),
                  // Categories
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        )),
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h, right: 20.w),
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                myListOfCat.length,
                                (index) => Container(
                                      margin: EdgeInsets.only(
                                        left: 20.w,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 80.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "img/${myListOfCat.keys.elementAt(index)}")),
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SimpleText(
                                              text: myListOfCat.values
                                                  .elementAt(index),
                                              color: Colors.black,
                                              size: 15.sp),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      ),
                                    )),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

// Custom Listview
  ListView customBuilder(
      {required int length, required List<dynamic>? collection}) {
    return ListView.builder(
      itemCount: emotions.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(left: 7.w, top: 10.h, right: 10.w),
        height: 280.h,
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("img/${collection![index]}"),
          ),
        ),
      ),
    );
  }
}
