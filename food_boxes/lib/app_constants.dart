import 'package:flutter/material.dart';
import 'package:food_boxes/model/bottom_bar_items.dart';
import 'package:food_boxes/widgets/account_page.dart';

import 'widgets/schedule_page.dart';
import 'widgets/tickets_page.dart';

class AppConstants {
  AppConstants._();

  static const boxName = 'myBox';

  static const circleRadius = BorderRadius.all(Radius.circular(20));

  static const List<String> ticketImages = [
    "assets/images/dark_veggies.jpg",
    "assets/images/light_veggies.jpg",
    "assets/images/veggie_market.jpg",
    "assets/images/veggie_pile.jpg",
    "assets/images/veggie_plates.jpg",
    "assets/images/veggie_scale.jpg",
    "assets/images/veggies_on_table.jpg",
  ];

  static const menuItemList = <BottomBarItems>[
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
      bodyBuild: TicketsPage(),
      labelText: "Tickets",
    )
  ];
}
