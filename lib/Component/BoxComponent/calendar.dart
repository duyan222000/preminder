import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar(this.openCalendar, this._date, this.onDateChange, {super.key});
  final bool openCalendar;
  final List<DateTime?> _date;
  final Function onDateChange;
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return widget.openCalendar
        ? Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                ),
                value: widget._date,
                onValueChanged: (dates) => widget.onDateChange(dates),
              ),
            ),
          )
        : Container();
  }
}
