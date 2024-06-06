import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarAppbar extends StatefulWidget {
  const CalendarAppbar({Key? key}) : super(key: key);

  @override
  State<CalendarAppbar> createState() => _CalendarAppbarState();
}

class _CalendarAppbarState extends State<CalendarAppbar> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
  CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
  CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return CalendarAgenda(
      appbar: true,
      selectedDayPosition: SelectedDayPosition.right,
      controller: _calendarAgendaControllerNotAppBar,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      // fullCalendar: false,
      locale: 'en',
      fullCalendarScroll: FullCalendarScroll.horizontal,
      weekDay: WeekDay.long,
      fullCalendarDay: WeekDay.short,
      selectedDateColor: Colors.black,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      events: List.generate(
          100,
              (index) => DateTime.now()
              .subtract(Duration(days: index * random.nextInt(365)))),
      onDateSelected: (date) {
        setState(() {
          _selectedDateNotAppBBar = date;
        });
      },
    );
    // ElevatedButton(
    //   onPressed: () {
    //     _calendarAgendaControllerNotAppBar.goToDay(DateTime.now());
    //   },
    //   child: Text("Today, appbar = false (default value)"),
    // ),
    // Text('Selected date is $_selectedDateNotAppBBar');
  }
}
