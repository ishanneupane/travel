import 'package:flutter/material.dart';
import 'package:visit_nepal/src/navigation_pages/home_page.dart';
import 'package:visit_nepal/src/navigation_pages/profile_page.dart';
import 'package:visit_nepal/src/navigation_pages/search_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List pages = [
    const Homepage(),
    const ProfilePage(),
    const SearchPage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green.shade400,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 18,
        enableFeedback: false,
        unselectedFontSize: 12,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.holiday_village),
          ),
          BottomNavigationBarItem(
            label: "profile",
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: "search",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
