import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import '../utility/size_config.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaledWidth(1),
              vertical: SizeConfig.scaledHeight(1),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context).textTheme.bodySmall!,
            weekendStyle: Theme.of(context).textTheme.bodySmall!,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
        ),
      ],
    );
  }
}
