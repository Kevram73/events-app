import 'package:flutter/material.dart';

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
      const Center(child: Icon(Icons.abc, size: 50)),
      const Center(child: Icon(Icons.class_rounded, size: 50)),
      const Center(child: Icon(Icons.person, size: 50)),
    ];

    final kBottomNavBarItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Tab 1"),
      const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Tab 2"),
      const BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Tab 3"),
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
        items: kBottomNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      appBar: kAppBarItems[_currentTabIndex],
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
