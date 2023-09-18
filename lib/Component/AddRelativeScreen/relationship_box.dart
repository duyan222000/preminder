import 'package:flutter/material.dart';

class RelationshipBox extends StatefulWidget {
  const RelationshipBox(this.relation, this.onChangeSelected, this.isSelected,
      {super.key});
  final String relation;
  final Function onChangeSelected;
  final bool isSelected;
  @override
  State<RelationshipBox> createState() => _RelationshipBoxState();
}

class _RelationshipBoxState extends State<RelationshipBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChangeSelected(widget.relation);
        });
      },
      child: Container(
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: widget.isSelected ? Color(0xFF209F84) : Color(0xFFE0E0E0)),
        ),
        child: Center(
          child: Text(widget.relation,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: widget.isSelected
                      ? Color(0xFF209F84)
                      : Color(0xFF424242))),
        ),
      ),
    );
  }
}
