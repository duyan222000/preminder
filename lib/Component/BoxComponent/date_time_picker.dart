import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DateTimePickerCustom extends StatefulWidget {
  DateTimePickerCustom(this.text, this.width, this._date, this.onDateChange,
      this.openCalendar, this.triggerOpenCalendar,
      {super.key});
  final String text;
  final width;
  final List<DateTime?> _date;
  final Function onDateChange;
  final bool openCalendar;
  final Function triggerOpenCalendar;
  @override
  State<DateTimePickerCustom> createState() => _DateTimePickerCustomState();
}

class _DateTimePickerCustomState extends State<DateTimePickerCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Color(0xFF424242))),
          ),
          GestureDetector(
            onTap: () {
              widget.triggerOpenCalendar();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: widget.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 23,
                  ),
                  SvgPicture.asset("assets/svgs/calendar.svg"),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                      (widget._date[0]!.day == DateTime.now().day &&
                              widget._date[0]!.month == DateTime.now().month &&
                              widget._date[0]!.year == DateTime.now().year)
                          ? "Now"
                          : DateFormat('dd-MM-yyyy').format(widget._date[0]!),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Color(0xFF424242))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
