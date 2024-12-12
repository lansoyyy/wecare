import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wecare/screens/reports_screen.dart';
import 'package:wecare/widgets/text_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        foregroundColor: Colors.white,
        title: TextWidget(
          text: 'Monthly Report',
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      body: TableCalendar(
        onDaySelected: (selectedDay, focusedDay) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ReportsScreen(
                    date: selectedDay,
                  )));
        },
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
