import 'package:flutter/material.dart';

class CalendarBox extends StatelessWidget {
  const CalendarBox(this.date, this.onSelected, this.currentDate, {super.key});
  final DateTime date;
  final Function onSelected;
  final DateTime currentDate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onSelected(date), print(currentDate)},
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
            height: 80,
            width: 56,
            decoration: BoxDecoration(
                color:
                    date == currentDate ? Color(0xFF209F84) : Color(0xFFFFFFFF),
                borderRadius: const BorderRadius.all(Radius.circular(9))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    date.day.toString().length < 2
                        ? "0" + date.day.toString()
                        : date.day.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        color: date == currentDate
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF424242))),
                Text("Th" + date.month.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: date == currentDate
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF424242)))
              ],
            ))),
      ),
    );
  }
}
