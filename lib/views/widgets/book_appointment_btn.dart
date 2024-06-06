
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/padding.dart';

class BookAppointment extends StatelessWidget {
  final String texts;
  const BookAppointment({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(7)),
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: appPadding,vertical: 5),
      child: Center(
          child: Text(
            texts,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          )),
    );
  }
}
