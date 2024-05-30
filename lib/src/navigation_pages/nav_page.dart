import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/src/navigation_pages/home_page.dart';
import 'package:visit_nepal/src/navigation_pages/search_page.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List pages = [
    const Homepage(),
    const SearchPage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AppCubits>(context).login();
              },
              child: const Row(
                children: [
                  Expanded(child: CustomText(text: "Log Out")),
                  Icon(Icons.logout)
                ],
              ),
            ),
          ],
        ),
      ),
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
            label: "search",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
