
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlotAppointment extends StatefulWidget {
   SlotAppointment({Key? key}) : super(key: key);

  @override
  State<SlotAppointment> createState() => _SlotAppointmentState();
}

class _SlotAppointmentState extends State<SlotAppointment> {
  int rounded = 15;

  List<String> day = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM'
  ];

  List<int> days = [
    15,
    25,
    35,
    45,
    55,
    15,
    25,
    35,
    45,
    55,
    55,
    15,
  ];

  int _selectedIndex2 = 0;

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
                _selectedIndex2 = index;
                rounded = days[index];
                print("::::::index::::::");
                print(rounded);
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10, top: 0, bottom: 15),
              padding:
              EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              decoration: BoxDecoration(
                // border:
                // Border.all(width: 0.5, color: Theme.of(context).primaryColor),
                color: _selectedIndex2 == index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).hoverColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: _selectedIndex2 == index
                      ? Colors.white
                      : Theme.of(context).focusColor,
                  fontWeight: _selectedIndex2 == index
                      ? FontWeight.normal
                      : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
