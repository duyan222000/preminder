import 'package:flutter/material.dart';
import 'package:preminder/Variable/people.dart';

class RelativeBox extends StatefulWidget {
  const RelativeBox(this.relative, {super.key});
  final People relative;
  @override
  State<RelativeBox> createState() => _RelativeBoxState();
}

class _RelativeBoxState extends State<RelativeBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: Color(0xFFEC4545),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Center(
                  child: Text(
                      "${widget.relative.name.split(" ")[0][0].toUpperCase()}${widget.relative.name.split(" ")[1][0].toUpperCase()} ",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: Color(0xFFFFFFFF))))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(widget.relative.relation,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFF424242))),
            ),
            Text("${widget.relative.prescriptionList.length} toa thuốc",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    color: Color(0xFF828282))),
          ],
        )
      ],
    );
  }
}
