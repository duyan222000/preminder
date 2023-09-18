import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(this.text, this.onChange, {super.key});
  final String text;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 28, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Color(0xFF424242))),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              onChanged: (value) {
                onChange(value);
              },
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
