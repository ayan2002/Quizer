import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types, must_be_immutable
class Text_Styles extends StatelessWidget {
  Text_Styles(this.text, {super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 28,
        color: Colors.white,
      ),
    );
  }
}
