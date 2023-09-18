import 'package:flutter/material.dart';
import 'package:preminder/Component/HomeScreen/Calendar/calendar_scroll_view.dart';
import 'package:preminder/Component/HomeScreen/Drawer/drawer.dart';
import 'package:preminder/Component/HomeScreen/MedicineList/medicine_list.dart';
import 'package:preminder/Component/HomeScreen/MedicineList/relative_top_bar.dart';
import 'package:preminder/Component/HomeScreen/greeting_top_bar.dart';
import 'package:preminder/Variable/medicine.dart';
import 'package:preminder/Variable/people.dart';
import 'package:preminder/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  People currentPeople = user.familyMember[0];
  List<Medicine> tempMedicineList = [];
  List<List<Medicine>> medicineList = [];
  DateTime currentDate = DateTime.now();
  void onClickFamilyMember(people) {
    setState(() {
      currentPeople = people;
      tempMedicineList.clear();
      medicineList.clear();
      for (var prescription in currentPeople.prescriptionList) {
        for (var medicine in prescription.medicineList) {
          for (var time in medicine.dailyDose) {
            if (currentDate.day >= prescription.startDate.day &&
                currentDate.day <= prescription.endDate.day &&
                currentDate.month >= prescription.startDate.month &&
                currentDate.month <= prescription.endDate.month &&
                currentDate.year >= prescription.startDate.year &&
                currentDate.year <= prescription.endDate.year) {
              tempMedicineList.add(Medicine(
                  name: medicine.name,
                  amount: medicine.amount,
                  parameter: medicine.parameter,
                  frequency: medicine.frequency,
                  dailyDose: [time],
                  note: medicine.note,
                  displayPicture: medicine.displayPicture));
            }
          }
        }
      }
      tempMedicineList.sort(((a, b) => DateTime.parse(a.dailyDose[0].toString())
          .compareTo(DateTime.parse(b.dailyDose[0].toString()))));
      if (tempMedicineList.isNotEmpty) {
        medicineList.add([tempMedicineList[0]]);
        for (var i = 1; i < tempMedicineList.length; ++i) {
          if (tempMedicineList[i].dailyDose[0].hour.toString() ==
              tempMedicineList[i - 1].dailyDose[0].hour.toString()) {
            medicineList.last.add(tempMedicineList[i]);
          } else {
            medicineList.add([tempMedicineList[i]]);
          }
        }
      }
    });
  }

  void onChangeDate(DateTime date) {
    setState(() {
      currentDate = date;
      tempMedicineList.clear();
      medicineList.clear();
      for (var prescription in currentPeople.prescriptionList) {
        for (var medicine in prescription.medicineList) {
          for (var time in medicine.dailyDose) {
            if (currentDate.day >= prescription.startDate.day &&
                currentDate.day <= prescription.endDate.day &&
                currentDate.month >= prescription.startDate.month &&
                currentDate.month <= prescription.endDate.month &&
                currentDate.year >= prescription.startDate.year &&
                currentDate.year <= prescription.endDate.year) {
              tempMedicineList.add(Medicine(
                  name: medicine.name,
                  amount: medicine.amount,
                  parameter: medicine.parameter,
                  frequency: medicine.frequency,
                  dailyDose: [time],
                  note: medicine.note,
                  displayPicture: medicine.displayPicture));
            }
          }
        }
      }
      tempMedicineList.sort(((a, b) => DateTime.parse(a.dailyDose[0].toString())
          .compareTo(DateTime.parse(b.dailyDose[0].toString()))));
      if (tempMedicineList.isNotEmpty) {
        medicineList.add([tempMedicineList[0]]);
        for (var i = 1; i < tempMedicineList.length; ++i) {
          if (tempMedicineList[i].dailyDose[0].hour.toString() ==
              tempMedicineList[i - 1].dailyDose[0].hour.toString()) {
            medicineList.last.add(tempMedicineList[i]);
          } else {
            medicineList.add([tempMedicineList[i]]);
          }
        }
      }
    });
  }

  void openDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  void initState() {
    onClickFamilyMember(user.familyMember[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: const SideDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 30, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GreetingTopBar(openDrawer),
              Padding(
                padding: const EdgeInsets.only(top: 17.0, bottom: 20),
                child: Flexible(child: CalendarScrollView(onChangeDate)),
              ),
              Stack(
                children: [
                  RelativeTopBar(currentPeople, onClickFamilyMember),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Container(
                      color: const Color(0xFF828282),
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: MedicineList(medicineList)),
            ],
          ),
        ));
  }
}
