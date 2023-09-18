import 'package:flutter/material.dart';
import 'package:preminder/db.dart';

class GreetingTopBar extends StatelessWidget {
  const GreetingTopBar(this.openDrawer, {super.key});
  final Function openDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            onTap: () {
              openDrawer();
            },
            child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color(0xFFEC4545),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(
                    child: Text(
                        "${user.firstName[0].toUpperCase()}${user.lastName[0].toUpperCase()}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Color(0xFFFFFFFF))))),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${user.lastName}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Color(0xFF424242))),
            const Text("Have a good day",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    color: Color(0xFF424242)))
          ],
        )
      ],
    );
  }
}
