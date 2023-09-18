import 'package:flutter/material.dart';
import 'package:preminder/Component/AddRelativeScreen/relationship_box.dart';
import 'package:preminder/Component/BoxComponent/calendar.dart';
import 'package:preminder/Component/BoxComponent/date_time_picker.dart';
import 'package:preminder/Component/BoxComponent/drop_down_box.dart';
import 'package:preminder/Component/BoxComponent/text_input_field.dart';
import 'package:preminder/Variable/people.dart';
import 'package:preminder/db.dart';

class RelativeScreen extends StatefulWidget {
  const RelativeScreen({super.key});

  @override
  State<RelativeScreen> createState() => _RelativeScreenState();
}

class _RelativeScreenState extends State<RelativeScreen> {
  String? name;
  void changeName(value) {
    name = value;
  }

  String? nickname;
  void changeNickname(value) {
    nickname = value;
  }

  List<DateTime?> dob = [DateTime.now()];
  bool openDOBCalendar = false;
  void changeDOB(tempDate) {
    setState(() {
      dob = tempDate;
    });
  }

  void triggerOpenDOBCalendar() {
    setState(() {
      openDOBCalendar = !openDOBCalendar;
    });
  }

  String gender = "Other";
  void changeGender(value) {
    setState(() {
      gender = value;
    });
  }

  String currentRelationship = "Son";
  void changeRelationship(value) {
    setState(() {
      currentRelationship = value;
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        backgroundColor: const Color(0xFF209F84),
        title: const Center(
          child: Text("Relative Information",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: Color(0xFFFFFFFF))),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInputField("Name", changeName),
                    TextInputField("Nickname", changeNickname),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 20),
                          child: DateTimePickerCustom(
                              "Date Of Birth",
                              MediaQuery.of(context).size.width / 2.5,
                              dob,
                              changeDOB,
                              openDOBCalendar,
                              triggerOpenDOBCalendar),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: DropDownBox(
                                "Gender",
                                const ['Male', 'Female', 'Other'],
                                changeGender,
                                "Select Your Gender",
                                true),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 8.0),
                      child: Text("Relationship",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Color(0xFF424242))),
                    ),
                    SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 100,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: 6,
                            itemBuilder: (BuildContext ctx, index) {
                              return RelationshipBox(
                                  relationship[index],
                                  changeRelationship,
                                  relationship[index] == currentRelationship
                                      ? true
                                      : false);
                            }),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 16),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Color(0xFF209F84)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      user.familyMember.add(People(
                                          name: name!,
                                          nickname: nickname!,
                                          relation: currentRelationship,
                                          gender: gender,
                                          DOB: dob[0]!,
                                          prescriptionList: []));
                                    });
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                  child: const Text("Save",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins",
                                          color: Color(0xFFFFFFFF))),
                                ),
                              ),
                            ))),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30, top: 250),
                  child: Calendar(openDOBCalendar, dob, changeDOB),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
