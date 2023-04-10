import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "Account",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: "Food Boxes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: "Tickets",
        ),
      ]),
    );
  }
}
