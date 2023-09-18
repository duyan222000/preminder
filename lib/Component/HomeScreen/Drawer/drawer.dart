import 'package:flutter/material.dart';
import 'package:preminder/Component/AddRelativeScreen/relative_screen.dart';
import 'package:preminder/Component/HomeScreen/Drawer/relative_box.dart';
import 'package:preminder/db.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width / 1.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 51),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Container(
                height: 72,
                width: 72,
                decoration: const BoxDecoration(
                    color: Color(0xFFEC4545),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(
                    child: Text(
                        "${user.firstName[0].toUpperCase()}${user.lastName[0].toUpperCase()}",
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Color(0xFFFFFFFF))))),
          ),
          Text("${user.firstName} ${user.lastName}",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Color(0xFF424242))),
          Text("${user.familyMember[0].prescriptionList.length} toa thuốc",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xFF828282))),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 22, bottom: 20),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
              height: 1,
            ),
          ),
          for (var i = 1; i < user.familyMember.length; ++i)
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: RelativeBox(user.familyMember[i]),
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RelativeScreen()),
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Color(0xFFEBF6F4),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Center(
                          child: Text("+",
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  color: Color(0xFF209F84))))),
                ),
                Text("Add Relative",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: Color(0xFF424242))),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
