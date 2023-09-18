import 'package:preminder/Variable/prescription.dart';

class People {
  String name;
  String nickname;
  String relation;
  String gender;
  DateTime DOB;
  List<Prescription> prescriptionList;
  People(
      {required this.name,
      required this.nickname,
      required this.relation,
      required this.prescriptionList,
      required this.gender,
      required this.DOB});
}
