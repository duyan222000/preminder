import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicineColor extends StatefulWidget {
  const MedicineColor(this.svgPath, this.svgOutlinePath, this.color,
      this.selected, this.changeIcon,
      {super.key});
  final String svgOutlinePath;
  final String svgPath;
  final Color color;
  final bool selected;
  final Function changeIcon;
  @override
  State<MedicineColor> createState() => _MedicineColorState();
}

class _MedicineColorState extends State<MedicineColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.changeIcon(widget.svgPath.split("/").last.split('.').first,
            widget.svgPath, widget.svgOutlinePath);
      },
      child: Stack(
        children: [
          widget.selected
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
            child: SvgPicture.asset(
              widget.svgPath,
              color: widget.selected ? widget.color : null,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              widget.svgOutlinePath,
            ),
          )
        ],
      ),
    );
  }
}
