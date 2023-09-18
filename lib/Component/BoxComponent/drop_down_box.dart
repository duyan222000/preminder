import 'package:flutter/material.dart';

class DropDownBox extends StatefulWidget {
  const DropDownBox(this.text, this.dropDownList, this.onChangeFunction,
      this.hintText, this.showTitle,
      {super.key});
  final String text;
  final List<dynamic> dropDownList;
  final Function onChangeFunction;
  final String hintText;
  final bool showTitle;
  @override
  State<DropDownBox> createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  String? tempValue = "";
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showTitle
              ? Text(widget.text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFF424242)))
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 500,
              itemHeight: null,
              isExpanded: true,
              decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  )),
              hint: Text(widget.hintText,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xFF424242))),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  widget.onChangeFunction(newValue);
                });
              },
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>(buildMenuItem)
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(item) {
    return DropdownMenuItem<String>(
      value: item.toString(),
      child: Text(item.toString(),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              color: Color(0xFF424242))),
    );
  }
}
