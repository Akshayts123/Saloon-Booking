

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderButtons extends StatefulWidget {
   HeaderButtons({Key? key}) : super(key: key);

  @override
  State<HeaderButtons> createState() => _HeaderButtonsState();
}

class _HeaderButtonsState extends State<HeaderButtons> {
  List<String> day = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
  ];

  List<IconData> iconsok = [Icons.home, Icons.airplanemode_active, Icons.train];

  List<int> days = [
    15,
    25,
    35,
  ];

   int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: day.asMap().entries.map((entry) {
          int index = entry.key;
          String title = entry.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(
                  right: 10, top: 0, bottom: 0),
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 10),
              decoration: BoxDecoration(
                border: _selectedIndex == index
                    ? Border.all(
                    width: 1, color: Colors.white)
                    : Border.all(
                    width: 0.5,
                    color:
                    Theme.of(context).primaryColor),
                color: _selectedIndex == index
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(
                        iconsok[index],
                        color: Colors.white,
                        size: 20,
                      )),
                  Text(
                    title,
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.white,
                      fontWeight: _selectedIndex == index
                          ? FontWeight.normal
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
