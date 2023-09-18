import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:preminder/Component/BoxComponent/drop_down_box.dart';
import 'package:preminder/Component/BoxComponent/text_input_field.dart';
import 'package:preminder/Component/MedicineListScreen/medicine_list.dart';
import 'package:preminder/Component/MedicineScreen/color_scroll_bar.dart';
import 'package:preminder/Component/MedicineScreen/medicine_icon.dart';
import 'package:preminder/Variable/display_picture.dart';
import 'package:preminder/Variable/medicine.dart';
import 'package:preminder/Variable/prescription.dart';
import 'package:preminder/db.dart';

class MedicineSCreen extends StatefulWidget {
  const MedicineSCreen(this.addMedicine, this.tempPrescription, {super.key});
  final Function addMedicine;
  final Prescription tempPrescription;
  @override
  State<MedicineSCreen> createState() => _MedicineSCreenState();
}

class _MedicineSCreenState extends State<MedicineSCreen> {
  String medicineName = "";
  void changeMedicineName(value) {
    setState(() {
      medicineName = value;
    });
  }

  int totalAmount = 0;
  void changeTotalAmount(value) {
    if (value != null)
      setState(() {
        totalAmount = int.parse(value);
      });
  }

  String parameter = "";
  void changeParameter(value) {
    setState(() {
      parameter = value;
    });
  }

  String frequency = "";
  void changeFrequency(value) {
    setState(() {
      frequency = value;
    });
  }

  String dailyDose = "";
  void changeDailyDose(value) {
    setState(() {
      dailyDose = value;
      dailyDoseTime = int.parse(dailyDose[0]);
    });
  }

  int dailyDoseTime = 0;
  String? time1, time2, time3, time4, time5, time6, time7;
  List<DateTime> dailyDoseTimeList = [];
  void changeDailyDoseTimeList(value) {
    setState(() {
      dailyDose = value;
    });
  }

  void changeTime1(value) {
    setState(() {
      time1 = value;
    });
  }

  void changeTime2(value) {
    setState(() {
      time2 = value;
    });
  }

  void changeTime3(value) {
    setState(() {
      time3 = value;
    });
  }

  void changeTime4(value) {
    setState(() {
      time4 = value;
    });
  }

  void changeTime5(value) {
    setState(() {
      time5 = value;
    });
  }

  void changeTime6(value) {
    setState(() {
      time6 = value;
    });
  }

  void changeTime7(value) {
    setState(() {
      time7 = value;
    });
  }

  String note = "";
  void changeNote(value) {
    setState(() {
      note = value;
    });
  }

  Color color = Colors.white;
  void changeColor(value) {
    setState(() {
      color = value;
    });
  }

  String? selectedSvg, selecedSvgOutline;
  void changeIcon(value, valueOutline) {
    setState(() {
      selectedSvg = value;
      selecedSvgOutline = valueOutline;
    });
  }

  String selectedIcon = 'noicon_icon.svg',
      svg1 = "assets/svgs/noicon_icon.svg",
      svg2 = "";
  void changeSelectedIcon(value, value1, value2) {
    setState(() {
      selectedIcon = value;
      svg1 = value1;
      svg2 = value2;
    });
  }

  List<DateTime> tempDailyDose = [];
  Medicine? tempMedicine;
  void addDate(DateTime i) {
    time1 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time1" : time1}:00"))
        : null;
    time2 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time2" : time2}:00"))
        : null;
    time3 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time3" : time3}:00"))
        : null;
    time4 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time4" : time4}:00"))
        : null;
    time5 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time5" : time5}:00"))
        : null;
    time6 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time6" : time6}:00"))
        : null;
    time7 != null
        ? tempDailyDose.add(DateFormat("yyyy-MM-dd hh:mm:ss").parse(
            "${i.year}-${i.month < 10 ? '0${i.month}' : i.month}-${i.day} ${time1!.split(':').first.length < 2 ? "0$time7" : time7}:00"))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                print(time1);
                print(widget.tempPrescription.endDate
                    .difference(widget.tempPrescription.startDate)
                    .inDays);
                print(widget.tempPrescription.endDate);
                print(widget.tempPrescription.startDate);

                addDate(widget.tempPrescription.startDate);

                tempMedicine = Medicine(
                    name: medicineName,
                    amount: totalAmount,
                    parameter: parameter,
                    frequency: frequency,
                    dailyDose: tempDailyDose,
                    note: note,
                    displayPicture: DisplayPicture(
                        svgPath: svg1, svgOutline: svg2, color1: color));
                print(tempMedicine);
                widget.addMedicine(tempMedicine);
                print(widget.tempPrescription.medicineList);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MedicineList(
                          widget.tempPrescription, widget.addMedicine)),
                );
              },
              child: const Text("Continue",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFFFFFFFF))),
            )
          ],
          title: const Center(
            child: Text("Medicine Information",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    color: Color(0xFFFFFFFF))),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          backgroundColor: const Color(0xFF209F84),
        ),
        body: Scrollbar(
            controller: _scrollController,
            thumbVisibility: false,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextInputField("Medicine Name", changeMedicineName),
                    Row(
                      children: [
                        Expanded(
                            child: TextInputField(
                                "Total Amount", changeTotalAmount)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: DropDownBox(
                                "Parameter",
                                <String>["Pill", "Tablet", "Tube"],
                                changeParameter,
                                "Parameter",
                                true),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: DropDownBox(
                          "Frequency",
                          const [
                            "Daily",
                            "Once Every Two Days",
                            "Once Every Three Days",
                            "Once Every Four Days",
                            "Once Every Five Days",
                            "Once Every Six Days",
                            "Once Every Seven Day"
                          ],
                          changeFrequency,
                          "Frequency",
                          true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: DropDownBox(
                          "Frequency",
                          const [
                            "1 time/ day",
                            "2 times/ day",
                            "3 times/ day",
                            "4 times/ day",
                            "5 times/ day",
                            "6 times/ day",
                            "7 times/ day",
                          ],
                          changeDailyDose,
                          "Daily Dose",
                          true),
                    ),
                    for (int i = 0; i < dailyDoseTime; ++i)
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: DropDownBox(
                            "Frequency",
                            hours,
                            i == 0
                                ? changeTime1
                                : i == 1
                                    ? changeTime2
                                    : i == 2
                                        ? changeTime3
                                        : i == 3
                                            ? changeTime4
                                            : i == 4
                                                ? changeTime5
                                                : i == 5
                                                    ? changeTime6
                                                    : changeTime7,
                            "Choose time",
                            false),
                      ),
                    TextInputField("Note", changeNote),
                    MedicineIcon(color, changeSelectedIcon, selectedIcon),
                    ColorScrollBar(changeColor, color)
                  ],
                ))));
  }
}
