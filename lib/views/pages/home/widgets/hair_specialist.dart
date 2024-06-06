import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';
import '../../../widgets/rating.dart';

class HairSpecialist extends StatefulWidget {
  final images;
  HairSpecialist({Key? key, this.images}) : super(key: key);

  @override
  State<HairSpecialist> createState() => _HairSpecialistState();
}

class _HairSpecialistState extends State<HairSpecialist> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          spreadRadius: 2.0,
          blurRadius: 2.0,
        )
      ], color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(left: appPadding, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            height: size.width * .42,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.images,
                  width: 162,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ben Jonsan",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 5,
                ),
                StarRating(
                  rating: rating,
                  onRatingChanged: (rating) =>
                      setState(() => this.rating = rating),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.phone,
                      //   size: 13,
                      //   color: Theme.of(context).focusColor,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Text(
                        '8606872355',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
