import 'dart:math';

import 'package:barbershop/views/widgets/book_appointment_btn.dart';
import 'package:barbershop/views/pages/appointment/widgets/calendar_appbar.dart';
import 'package:barbershop/views/pages/appointment/widgets/hair_specialist_widget.dart';
import 'package:barbershop/views/pages/appointment/widgets/heading.dart';
import 'package:barbershop/views/pages/appointment/widgets/slot.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/padding.dart';
import '../../widgets/header.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int? _selectedIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalendarAppbar(),
            Heading(
              heading: 'Available Slot',
            ),
            SizedBox(
              height: 10,
            ),
            SlotAppointment(),
            Heading(
              heading: 'Choose Hair Specialist',
            ),
            SizedBox(
              height: 10,
            ),
            HairSpecialistWidget()
          ],
        ),
      ),
      bottomNavigationBar: BookAppointment(texts: 'Book Appointment',)
    );
  }
}
