import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preminder/Component/PrescriptionScreen/prescription_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator(this.currentPage, this.onNavigatorSelected,
      {super.key});
  final String currentPage;
  final Function onNavigatorSelected;
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // widget.currentPage == "Home Page"
        //     ? SvgPicture.asset("assets/svgs/home_icon.svg",
        //         color: Color(0xFF209F84))
        //     : GestureDetector(
        //         onTap: () {
        //           widget.onNavigatorSelected("Home Page");
        //         },
        //         child: SvgPicture.asset(
        //           "assets/svgs/home_icon.svg",
        //         ),
        //       ),
        // widget.currentPage == "List Page"
        //     ? SvgPicture.asset("assets/svgs/list_icon.svg",
        //         color: Color(0xFF209F84))
        //     : GestureDetector(
        //         onTap: () {
        //           widget.onNavigatorSelected("List Page");
        //         },
        //         child: SvgPicture.asset(
        //           "assets/svgs/list_icon.svg",
        //         ),
        //       ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrescriptionScreen()),
              );
            },
            child: SvgPicture.asset("assets/svgs/add_icon.svg")),
        // widget.currentPage == "Search Page"
        //     ? SvgPicture.asset("assets/svgs/search_icon.svg",
        //         color: Color(0xFF209F84))
        //     : GestureDetector(
        //         onTap: () {
        //           widget.onNavigatorSelected("Search Page");
        //         },
        //         child: SvgPicture.asset(
        //           "assets/svgs/search_icon.svg",
        //         ),
        //       ),
        // widget.currentPage == "Setting Page"
        //     ? SvgPicture.asset("assets/svgs/setting_icon.svg",
        //         color: Color(0xFF209F84))
        //     : GestureDetector(
        //         onTap: () {
        //           widget.onNavigatorSelected("Setting Page");
        //         },
        //         child: SvgPicture.asset(
        //           "assets/svgs/setting_icon.svg",
        //         ),
        //       ),
      ],
    );
  }
}
