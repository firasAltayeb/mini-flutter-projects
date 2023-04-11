import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Tickets",
          ),
        ],
        currentIndex: 1,
        onTap: (int index) {
          Navigator.of(context).pushNamed(
            Constants.routeNames[index],
          );
        },
      ),
    );
  }
}
