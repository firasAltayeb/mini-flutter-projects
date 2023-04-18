import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerStyle: HeaderStyle(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          enabledDayPredicate: (day) => day.isAfter(
            DateTime.now(),
          ),
          focusedDay: DateTime.now(),
        ),
      ],
    );
  }
}
