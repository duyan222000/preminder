import 'package:flutter/material.dart';
import 'package:preminder/Component/MedicineScreen/color_box.dart';

class ColorScrollBar extends StatefulWidget {
  const ColorScrollBar(this.changeColor, this.currentColor, {super.key});
  final Function changeColor;
  final Color currentColor;
  @override
  State<ColorScrollBar> createState() => _ColorScrollBarState();
}

class _ColorScrollBarState extends State<ColorScrollBar> {
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFFFF)),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorBox(
                        Color(0xFF333333),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF333333)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF4F4F4F),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF4F4F4F)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF828282),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF828282)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFF2F2F2),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFF2F2F2)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFFFFFFF),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFFFFFFF)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF828282),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF828282)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFEB5757),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFEB5757)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFF2994A),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFF2994A)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFF2C94C),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFF2C94C)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFF2C94C),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFF2C94C)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF27AE60),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF27AE60)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF6FCF97),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF6FCF97)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF20799F),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF20799F)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF0368F0),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF0368F0)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF2F80ED),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF2F80ED)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF2D9CDB),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF2D9CDB)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF84E1FF),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF84E1FF)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF9B51E0),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF9B51E0)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFBB6BD9),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFBB6BD9)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFEE8DD9),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFEE8DD9)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFFFACED),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFFFACED)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFF963D21),
                        widget.changeColor,
                        widget.currentColor == Color(0xFF963D21)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFBE6A5E),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFBE6A5E)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFEB9083),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFEB9083)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFFFACA0),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFFFACA0)
                            ? true
                            : false),
                    ColorBox(
                        Color(0xFFFED8D3),
                        widget.changeColor,
                        widget.currentColor == Color(0xFFFED8D3)
                            ? true
                            : false),
                  ]),
            ),
          )),
    );
  }
}
