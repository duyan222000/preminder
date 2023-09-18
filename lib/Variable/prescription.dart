import 'package:preminder/Variable/medicine.dart';

class Prescription {
  List<Medicine> medicineList;
  String diagnose;
  DateTime startDate;
  DateTime endDate;
  DateTime reexamDate;
  String patientName;
  String year;
  String gender;
  String hospital;
  String address;
  String note;
  Prescription(
      {required this.medicineList,
      required this.diagnose,
      required this.startDate,
      required this.endDate,
      required this.reexamDate,
      required this.patientName,
      required this.year,
      required this.gender,
      required this.hospital,
      required this.address,
      required this.note});
}
