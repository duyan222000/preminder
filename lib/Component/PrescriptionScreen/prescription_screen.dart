import 'package:flutter/material.dart';
import 'package:preminder/Component/BoxComponent/calendar.dart';
import 'package:preminder/Component/BoxComponent/date_time_picker.dart';
import 'package:preminder/Component/BoxComponent/drop_down_box.dart';
import 'package:preminder/Component/BoxComponent/text_input_field.dart';
import 'package:preminder/Component/MedicineScreen/medicine_screen.dart';
import 'package:preminder/Variable/prescription.dart';
import 'package:preminder/db.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  bool openStartDateCalendar = false;
  bool openEndDateCalendar = false;
  bool openReexamineDateCalendar = false;
  String diagnose = "";
  String patientName = "";
  String hospital = "";
  String address = "";
  String note = "";
  List<DateTime?> startDate = [DateTime.now()];
  List<DateTime?> endDate = [DateTime.now()];
  List<DateTime?> reexamineDate = [DateTime.now()];
  Prescription? tempPrescription;
  String year = "";
  String gender = "";
  void triggerOpenStartDateCalendar() {
    setState(() {
      openEndDateCalendar = false;
      openReexamineDateCalendar = false;
      openStartDateCalendar = !openStartDateCalendar;
    });
  }

  void triggerOpenEndDateCalendar() {
    setState(() {
      openStartDateCalendar = false;
      openReexamineDateCalendar = false;
      openEndDateCalendar = !openEndDateCalendar;
    });
  }

  void triggerReexamineDateEndDateCalendar() {
    setState(() {
      openStartDateCalendar = false;
      openEndDateCalendar = false;
      openReexamineDateCalendar = !openReexamineDateCalendar;
      print(listyears);
    });
  }

  void changeStartDate(tempDate) {
    setState(() {
      startDate = tempDate;
    });
  }

  void changeEndDate(tempDate) {
    setState(() {
      endDate = tempDate;
    });
  }

  void changeReexamineDate(tempDate) {
    setState(() {
      reexamineDate = tempDate;
    });
  }

  void changeYear(value) {
    setState(() {
      year = value;
    });
  }

  void changeGender(value) {
    setState(() {
      gender = value;
    });
  }

  void changeDiagnose(value) {
    setState(() {
      diagnose = value;
    });
  }

  void changePatientName(value) {
    setState(() {
      patientName = value;
    });
  }

  void changeHospital(value) {
    setState(() {
      hospital = value;
    });
  }

  void changeAddress(value) {
    setState(() {
      address = value;
    });
  }

  void changeNote(value) {
    setState(() {
      note = value;
    });
  }

  void addMedicine(value) {
    setState(() {
      tempPrescription!.medicineList.add(value);
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        backgroundColor: const Color(0xFF209F84),
        title: const Center(
          child: Text("Prescription Information",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xFFFFFFFF))),
        ),
      ),
      body: Stack(
        children: [
          Scrollbar(
            controller: _scrollController,
            thumbVisibility: false,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInputField("Diagnose", changeDiagnose),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: DateTimePickerCustom(
                            "Start Date",
                            MediaQuery.of(context).size.width / 2.5,
                            startDate,
                            changeStartDate,
                            openStartDateCalendar,
                            triggerOpenStartDateCalendar),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: DateTimePickerCustom(
                            "End Date",
                            MediaQuery.of(context).size.width / 2.5,
                            endDate,
                            changeEndDate,
                            openEndDateCalendar,
                            triggerOpenEndDateCalendar),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: DateTimePickerCustom(
                        "Re-examination Date",
                        MediaQuery.of(context).size.width,
                        reexamineDate,
                        changeReexamineDate,
                        openReexamineDateCalendar,
                        triggerReexamineDateEndDateCalendar),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: DropDownBox(
                        "Patient Name",
                        user.familyMember.map((e) => e.nickname).toList(),
                        changePatientName,
                        "Family Member",
                        true),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: DropDownBox("Date Of Birth", listyears,
                              changeYear, "DOB", true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: DropDownBox(
                              "Gender",
                              ["Male", "Female", "Other"],
                              changeGender,
                              "Gender",
                              true),
                        ),
                      ),
                    ],
                  ),
                  TextInputField("Hospital", changeHospital),
                  TextInputField("Address", changeAddress),
                  TextInputField("Note", changeNote),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, right: 30, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        tempPrescription = Prescription(
                            medicineList: [],
                            diagnose: diagnose,
                            startDate: startDate[0]!,
                            endDate: endDate[0]!,
                            reexamDate: reexamineDate[0]!,
                            patientName: patientName,
                            year: year,
                            gender: gender,
                            hospital: hospital,
                            address: address,
                            note: note);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicineSCreen(
                                  addMedicine, tempPrescription!)),
                        );
                      },
                      child: Container(
                        height: 64,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF209F84),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Center(
                          child: Text("Save",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                  color: Color(0xFFFFFFFF))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 150),
            child: Calendar(openStartDateCalendar, startDate, changeStartDate),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 150),
            child: Calendar(openEndDateCalendar, endDate, changeEndDate),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 250),
            child: Calendar(
                openReexamineDateCalendar, reexamineDate, changeReexamineDate),
          )
        ],
      ),
    );
  }
}
