import 'package:flutter/material.dart';
import 'package:public_api/screens/main/home_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _listOfWidget,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: SlidingClippedNavBar(
            backgroundColor: Colors.grey.shade900,
            onButtonPressed: onButtonPressed,
            iconSize: 25,
            activeColor: Colors.blue,
            fontSize: 15,
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                icon: Icons.home,
                title: 'Home',
              ),
              BarItem(
                icon: Icons.search_rounded,
                title: 'Search',
              ),
              BarItem(
                icon: Icons.bolt_rounded,
                title: 'Energy',
              ),
              BarItem(
                icon: Icons.person_outline,
                title: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  const HomePage(),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.search,
      size: 56,
      color: Colors.brown,
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.bolt,
      size: 56,
      color: Colors.brown,
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.tune_rounded,
      size: 56,
      color: Colors.brown,
    ),
  ),
];
