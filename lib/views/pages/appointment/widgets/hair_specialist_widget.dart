

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/padding.dart';

class HairSpecialistWidget extends StatefulWidget {
  const HairSpecialistWidget({Key? key}) : super(key: key);

  @override
  State<HairSpecialistWidget> createState() => _HairSpecialistWidgetState();
}

class _HairSpecialistWidgetState extends State<HairSpecialistWidget> {
  int? _selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.width * .4,
      child: ListView.builder(
        padding: EdgeInsets.only(left: appPadding),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex1 = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 15, bottom: 10, top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  _selectedIndex1 == index
                      ? BoxShadow(
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                  )
                      : BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0.0,
                    blurRadius: 0.0,
                  )
                ],
              ),
              height: size.width * .37,
              width: 120,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/ban3.jpg",
                    width: 90,
                    height: 90,
                  ),
                  Text('Julia',style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
