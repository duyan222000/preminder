import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preminder/Variable/medicine.dart';
import 'package:preminder/db.dart';

class MedicineBox extends StatefulWidget {
  const MedicineBox(this.medicine, this.index, {super.key});
  final Medicine medicine;
  final int index;

  @override
  State<MedicineBox> createState() => _MedicineBoxState();
}

class _MedicineBoxState extends State<MedicineBox> {
  @override
  void initState() {
    count = ((count + 1) % 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BACKGROUND_COLOR[count],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 0, left: 15, right: 15),
        child: Row(
          children: [
            Center(
                child: Stack(children: [
              SvgPicture.asset(
                widget.medicine.displayPicture.svgPath,
                color: widget.medicine.displayPicture.svgOutline != ""
                    ? widget.medicine.displayPicture.color1
                    : null,
              ),
              if (widget.medicine.displayPicture.svgOutline != "")
                SvgPicture.asset(widget.medicine.displayPicture.svgOutline)
            ])),
            const SizedBox(width: 5),
            Container(
              width: widget.medicine.name.length.toDouble() * 12 <
                      MediaQuery.sizeOf(context).width * 0.5
                  ? widget.medicine.name.length.toDouble() * 12
                  : MediaQuery.sizeOf(context).width * 0.5,
              child: Text(widget.medicine.name,
                  softWrap: false,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: widget.medicine.displayPicture.svgOutline == ""
                          ? TEXT_COLOR[count]
                          : widget.medicine.displayPicture.color1)),
            ),
          ],
        ),
      ),
    );
  }
}
