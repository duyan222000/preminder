import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preminder/Variable/people.dart';
import 'package:preminder/db.dart';

class RelativeTopBar extends StatefulWidget {
  const RelativeTopBar(this.currentPeople, this.onClickFamilyMember,
      {super.key});
  final People currentPeople;
  final Function onClickFamilyMember;
  @override
  State<RelativeTopBar> createState() => _RelativeTopBarState();
}

class _RelativeTopBarState extends State<RelativeTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var people in user.familyMember)
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: GestureDetector(
              onTap: () => {widget.onClickFamilyMember(people)},
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 40,
                width: 70,
                child: Center(
                  child: Column(
                    children: [
                      Text(people.nickname,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: people == widget.currentPeople
                                  ? const Color(0xFF424242)
                                  : const Color(0xFF828282))),
                      people == widget.currentPeople
                          ? Padding(
                              padding: EdgeInsets.only(top: 13),
                              child: Container(
                                  height: 4,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF209F84),
                                      borderRadius: BorderRadius.circular(10))),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (user.familyMember.length > 2)
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SvgPicture.asset("assets/svgs/three_dots.svg"),
          ),
      ],
    );
  }
}
