import 'package:preminder/Variable/display_picture.dart';

class Medicine {
  String name;
  int amount;
  String parameter;
  String frequency;
  List<DateTime> dailyDose;
  String note;
  DisplayPicture displayPicture;
  Medicine(
      {required this.name,
      required this.amount,
      required this.parameter,
      required this.frequency,
      required this.dailyDose,
      required this.note,
      required this.displayPicture});
}
