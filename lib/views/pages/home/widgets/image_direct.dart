

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageDirect extends StatelessWidget {
  final image;
  const ImageDirect({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color(0xFF0d152c),
            Theme.of(context).primaryColor
          ],
        ),

        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  "Look Awesome & Save Some",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.center,
                child: Text("Get Upto 50% Off",style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),),
              ),
            ],
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
