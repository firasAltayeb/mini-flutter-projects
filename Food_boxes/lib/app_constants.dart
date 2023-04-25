import 'package:flutter/material.dart';

import '../model/bottom_bar_items.dart';
import '../widgets/account_page.dart';
import 'widgets/schedule_page.dart';

class AppConstants {
  AppConstants._();

  static const circleRadius = BorderRadius.all(Radius.circular(20));

  static const menuItemList = [
    BottomBarItems(
      iconData: Icons.account_circle_outlined,
      bodyBuild: AccountPage(),
      labelText: "Account",
    ),
    BottomBarItems(
      iconData: Icons.calendar_month,
      bodyBuild: SchedulePage(),
      labelText: "Schedule",
    ),
    BottomBarItems(
      iconData: Icons.receipt,
      bodyBuild: SchedulePage(),
      labelText: "Tickets",
    )
  ];
}
