import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preminder/Component/MedicineScreen/medicine_color.dart';

class MedicineIcon extends StatefulWidget {
  const MedicineIcon(this.color, this.changeIcon, this.currentIcon,
      {super.key});
  final Color color;
  final Function changeIcon;
  final currentIcon;
  @override
  State<MedicineIcon> createState() => _MedicineIconState();
}

class _MedicineIconState extends State<MedicineIcon> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: false,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFFFFF),
              ),
              child: Center(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          widget.currentIcon == "noicon_icon.svg"
                              ? Center(
                                  child: Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Container(
                                    width: 72,
                                    height: 72,
                                  ),
                                ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.changeIcon("noicon_icon.svg",
                                      "assets/svgs/noicon_icon.svg", "");
                                });
                              },
                              child: SvgPicture.asset(
                                "assets/svgs/noicon_icon.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                      MedicineColor(
                          "assets/svgs/whole_pill.svg",
                          "assets/svgs/whole_pill_outline.svg",
                          widget.color,
                          widget.currentIcon == "whole_pill" ? true : false,
                          widget.changeIcon),
                      MedicineColor(
                          "assets/svgs/circle_pill.svg",
                          "assets/svgs/circle_pill_outline.svg",
                          widget.color,
                          widget.currentIcon == "circle_pill" ? true : false,
                          widget.changeIcon),
                      MedicineColor(
                          "assets/svgs/powder.svg",
                          "assets/svgs/powder_outline.svg",
                          widget.color,
                          widget.currentIcon == "powder" ? true : false,
                          widget.changeIcon),
                      MedicineColor(
                          "assets/svgs/cream.svg",
                          "assets/svgs/cream_outline.svg",
                          widget.color,
                          widget.currentIcon == "cream" ? true : false,
                          widget.changeIcon),
                      MedicineColor(
                          "assets/svgs/niddle.svg",
                          "assets/svgs/niddle_outline.svg",
                          widget.color,
                          widget.currentIcon == "niddle" ? true : false,
                          widget.changeIcon),
                    ]),
              ),
            ),
          )),
    );
  }
}
