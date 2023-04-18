import 'package:flutter/material.dart';

import 'model/bottom_bar_items.dart';
import 'widgets/schedule_page.dart';
import 'widgets/account_page.dart';

class Constants {
  Constants._();

  static const menuItemlist = [
    BottomBarItems(
      iconData: Icons.account_circle_outlined,
      bodyBuild: AccountPage(),
      labelText: 'Account',
    ),
    BottomBarItems(
      iconData: Icons.calendar_month,
      bodyBuild: SchedulePage(),
      labelText: 'Schedule',
    ),
    BottomBarItems(
      iconData: Icons.receipt,
      bodyBuild: SchedulePage(),
      labelText: 'Tickets',
    ),
  ];
}
