import 'package:evant/screens/home/parts/details.dart';
import 'package:evant/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = [
      const Details(),
      const Center(child: Icon(Icons.class_rounded, size: 50)),
      const Center(child: Icon(Icons.person, size: 50)),
    ];

    final kBottomNavBarItems = [
      const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.tableList), label: "Tab 1"),
      const BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.plusCircle,
            size: 30,
          ),
          label: "Tab 2"),
      const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidCircleUser), label: "Tab 3"),
    ];

    final kAppBarItems = [
      AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      AppBar(
        centerTitle: true,
        title: const Text("Feeds"),
      ),
      AppBar(
        centerTitle: true,
        title: const Text("User Account"),
      ),
    ];

    assert(kTabPages.length == kBottomNavBarItems.length);

    final bottomNavBar = BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: ColorGame.lightPrimaryBack,
        selectedItemColor: ColorGame.lightPrimaryColor,
        items: kBottomNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
