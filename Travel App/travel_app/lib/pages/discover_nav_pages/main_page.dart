import 'package:flutter/material.dart';
import 'package:travel_app/pages/discover_nav_pages/home.dart';
import 'package:travel_app/pages/discover_nav_pages/my_page.dart';
import 'package:travel_app/pages/discover_nav_pages/search_page.dart';

import 'bar_pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List pages = const [
  Home(),
  BarPages(),
  SearchPages(),
  MyPages(),
];

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  changePages(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          changePages(value);
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: "HOME",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: "BAR",
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: "SEARCH",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "MY",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
