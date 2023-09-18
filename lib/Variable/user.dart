import 'package:preminder/Variable/people.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String gender;
  DateTime dob;
  List<People> familyMember;
  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.dob,
      required this.familyMember});
}
