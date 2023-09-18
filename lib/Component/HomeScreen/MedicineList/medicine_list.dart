import 'package:flutter/material.dart';
import 'package:preminder/Component/HomeScreen/MedicineList/medicine_box.dart';
import 'package:preminder/Variable/medicine.dart';

class MedicineList extends StatefulWidget {
  const MedicineList(this.medicineList, {super.key});
  final List<List<Medicine>> medicineList;
  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        child: Column(
          children: [
            for (var time in widget.medicineList)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("${time[0].dailyDose[0].hour.toString()}:00",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: Color(0xFF424242))),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int index = 0; index < time.length; ++index)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: MedicineBox(time[index], index),
                          ),
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
