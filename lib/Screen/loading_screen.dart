import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String appName = "Preminder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(children: <Widget>[
        Align(alignment: Alignment.topRight,child: SvgPicture.asset("assets/svgs/screen_icon1.svg")),
        Align(alignment: Alignment.bottomLeft,child: SvgPicture.asset("assets/svgs/screen_icon2.svg")),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: SvgPicture.asset("assets/svgs/icon.svg"),
                ),
                const SizedBox(height: 15),
                Text(appName,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        color: Color(0xFF4F4F4F))),
                const SizedBox(
                  height: 100,
                )
              ]),
        ),                
      ]),
    );
  }
}
