
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../consts/padding.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Hey!!",
              style:GoogleFonts.poppins(
                  color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Text(
              "Welcome to Hair Salon",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
