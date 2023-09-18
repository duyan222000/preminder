import 'package:flutter/material.dart';
import 'package:preminder/Component/BottomNavigator/bottom_navigator.dart';
import 'package:preminder/Screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentPage = "";
  void onNavigatorSelected(selectedPage) {
    setState(() {
      currentPage = selectedPage;
    });
  }

  @override
  void initState() {
    currentPage = "Home Page";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeScreen(),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 20, top: 30.0, left: 30, right: 30),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigator(currentPage, onNavigatorSelected)),
        )
      ],
    );
  }
}
