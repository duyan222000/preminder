import 'package:flutter/material.dart';

class ColorBox extends StatefulWidget {
  const ColorBox(this.color, this.changeColor, this.selected, {super.key});
  final Color color;
  final Function changeColor;
  final bool selected;
  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.changeColor(widget.color);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24.0, bottom: 24, left: 12, right: 12),
        child: Stack(
          children: [
            // widget.selected
            //     ? Center(
            //         child: Container(
            //           width: 72,
            //           height: 72,
            //           decoration: BoxDecoration(
            //             color: Color(0xFFF2F2F2),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       )
            //     : Center(
            //         child: Container(
            //           width: 72,
            //           height: 72,
            //         ),
            //       ),
            Center(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: widget.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
