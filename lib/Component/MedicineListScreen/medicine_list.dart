import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:preminder/Component/MedicineScreen/medicine_screen.dart';
import 'package:preminder/Variable/prescription.dart';
import 'package:preminder/db.dart';

class MedicineList extends StatefulWidget {
  const MedicineList(this.tempPresription, this.addMedicine, {super.key});
  final Prescription tempPresription;
  final Function addMedicine;
  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  user.familyMember
                      .where((element) =>
                          element.nickname ==
                          widget.tempPresription.patientName)
                      .first
                      .prescriptionList
                      .add(widget.tempPresription);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                });
              },
              child: const Text("Continue",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color(0xFFFFFFFF))),
            )
          ],
          title: Center(
            child: Text(widget.tempPresription.diagnose,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    color: Color(0xFFFFFFFF))),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          backgroundColor: const Color(0xFF209F84),
        ),
        body: Column(
          children: [
            for (var medicine in widget.tempPresription.medicineList)
              Padding(
                padding: const EdgeInsets.only(top: 22.0, left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 18, bottom: 18),
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicine.name,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xFF424242)),
                          ),
                          Text(
                            medicine.frequency,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                color: Color(0xFF424242)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                for (var time
                                    in medicine.dailyDose.toSet().toList())
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0,
                                            right: 15,
                                            top: 12,
                                            bottom: 12),
                                        child: Text(
                                          "${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Poppins",
                                              color: Color(0xFF424242)),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Stack(children: [
                              SvgPicture.asset(
                                medicine.displayPicture.svgPath,
                                color: medicine.displayPicture.svgOutline != ""
                                    ? medicine.displayPicture.color1
                                    : null,
                              ),
                              if (medicine.displayPicture.svgOutline != "")
                                SvgPicture.asset(
                                    medicine.displayPicture.svgOutline)
                            ]),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicineSCreen(
                                  widget.addMedicine, widget.tempPresription)),
                        );
                      },
                      child: const Text("+ Add Medicine",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Color(0xFF424242))),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
