import 'package:flutter/material.dart';
import 'package:preminder/Variable/people.dart';
import 'package:preminder/Variable/user.dart';

User user = User(
    firstName: "Van",
    lastName: "An",
    dob: DateTime.now(),
    gender: "Male",
    email: "anvan2k@gmail.com",
    familyMember: [
      People(
          name: "Duy An",
          nickname: "An",
          relation: "Me",
          gender: "Male",
          DOB: DateTime.now(),
          prescriptionList: []),
    ]);

final listyears = Iterable<int>.generate(DateTime.now().year + 1)
    .skip(1900)
    .toList()
    .reversed
    .toList();
final hours = List.generate(24 * 2,
        (i) => '${24 - (i / 2).truncate() - 1}:${i % 2 == 1 ? '00' : '30'}')
    .reversed
    .toList();
final relationship = <String>['Son', 'Dad', 'Mom', 'Wife', 'Husband', 'Other'];

List<Color> BACKGROUND_COLOR = [
  Color(0xFF37A991),
  Color(0xFFFFE2E2),
  Color(0xFFFFECB8),
  Color(0xFFC8F5FF),
  Color(0xFFF1F6F6)
];
List<Color> TEXT_COLOR = [
  Color(0xFF37A991),
  Color(0xFFEC4545),
  Color(0xFFD89613),
  Color(0xFF3D8D9E),
  Color(0xFF424242)
];

int count = 0;
