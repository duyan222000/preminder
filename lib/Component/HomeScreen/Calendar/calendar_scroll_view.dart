import 'package:flutter/material.dart';
import 'package:preminder/Component/HomeScreen/Calendar/calendar_box.dart';

class CalendarScrollView extends StatefulWidget {
  const CalendarScrollView(this.onDateChange, {super.key});
  final Function onDateChange;
  @override
  State<CalendarScrollView> createState() => _CalendarScrollViewState();
}

class _CalendarScrollViewState extends State<CalendarScrollView> {
  final ScrollController _calendarScrollController = ScrollController();
  DateTime currentDate = DateTime.now();
  final listDays = <DateTime>[];
  void addTime() {
    listDays.add(currentDate.subtract(Duration(days: 2)));
    listDays.add(currentDate.subtract(Duration(days: 1)));
    for (int i = 0; i < 20; ++i) {
      listDays.add(currentDate.add(Duration(days: i)));
    }
  }

  void selectedAction(selectedDate) {
    setState(() {
      currentDate = selectedDate;
      widget.onDateChange(selectedDate);
    });
  }

  @override
  void initState() {
    addTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _calendarScrollController,
      thumbVisibility: false,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _calendarScrollController,
          child: Row(children: <Widget>[
            for (int i = 0; i < listDays.length; ++i)
              CalendarBox(listDays[i], selectedAction, currentDate)
          ])),
    );
  }
}
