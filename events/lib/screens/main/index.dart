import 'package:events/screens/main/components/home.dart';
import 'package:events/services/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final home = 'Welcome';
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
          ),
          label: "Mes comptes"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.tab,
          ),
          label: 'Profil'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Profil'),
    ];

    final List<Widget> _kTabPages = [
      Home(),
      Container(),
      Container(),
      Container()
    ];

    final appBarText = ["home", "mescomptes", "profil"];

    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      backgroundColor: secondaryColor,
      fixedColor: primaryColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _currentTabIndex,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Name of Page
        centerTitle: true,
        title: Text(
          appBarText[1],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: secondaryColor,
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
