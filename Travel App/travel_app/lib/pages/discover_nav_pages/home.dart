import 'package:flutter/material.dart';
import 'package:travel_app/pages/widgets/large_text.dart';
import 'package:travel_app/pages/widgets/simple_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Map myListOfCat = {
    "kayaking.png": "KayaKing",
    "snorkling.png": "snorkling",
    "balloning.png": "balloning",
    "hiking.png": "hiking",
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
      body: Column(
        children: [
          //ROW/
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("img/kayaking.png"))),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: const LargeText(
                  text: "Discover", color: Colors.black, size: 25),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                isScrollable: true,
                controller: tabController,
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions"),
                ]),
          ),
          // Tab Views // Pictures of Collections
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              customBuilder(length: places.length, collection: places),
              customBuilder(
                  length: inspirations.length, collection: inspirations),
              customBuilder(length: emotions.length, collection: emotions),
            ]),
          ),
          // Explore More
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              children: [
                const SimpleText(
                    text: "Explore More", color: Colors.black, size: 19),
                Expanded(child: Container()),
                const SimpleText(text: "See All", color: Colors.blue, size: 17),
              ],
            ),
          ),
          // Categories
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "img/${myListOfCat.keys.elementAt(index)}")),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SimpleText(
                                    text: myListOfCat.values.elementAt(index),
                                    color: Colors.black,
                                    size: 15),
                              ],
                            ),
                          )),
                ),
              ),
            ),
          )
        ],
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
        margin: const EdgeInsets.only(left: 7, top: 10, right: 10),
        height: 280,
        width: 180,
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
