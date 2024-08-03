import 'package:flutter/material.dart';
import 'package:food_boxes/model/bottom_bar_items.dart';
import 'package:food_boxes/widgets/account_page.dart';

import 'model/food_box.dart';
import 'widgets/schedule_page.dart';
import 'widgets/tickets_page.dart';

class AppConstants {
  AppConstants._();

  static const boxName = 'myBox';

  static const circleRadius = BorderRadius.all(Radius.circular(20));

  static const maxBoxQuantity = 99;

  static const List<String> ticketImages = [
    "assets/images/dark_veggies.jpg",
    "assets/images/light_veggies.jpg",
    "assets/images/veggie_market.jpg",
    "assets/images/veggie_pile.jpg",
    "assets/images/veggie_plates.jpg",
    "assets/images/veggie_scale.jpg",
    "assets/images/veggies_on_table.jpg",
  ];

  static final exampleBoxes = [
    FoodBox(
      name: "Small Box",
      price: 10.00,
      date: DateTime(2023, 12, 10),
      description: "This is a small box of veggies",
    ),
    FoodBox(
      name: "Medium Box",
      price: 20.00,
      date: DateTime(2023, 12, 10),
      description: "This is a medium box of veggies",
    ),
    FoodBox(
      name: "Large Box",
      price: 30.00,
      date: DateTime(2023, 12, 10),
      description: "This is a large box of veggies",
    ),
    FoodBox(
      name: "Small Box",
      price: 14.00,
      date: DateTime(2023, 12, 14),
      description: "This is a small box of veggies",
    ),
    FoodBox(
      name: "Medium Box",
      price: 24.00,
      date: DateTime(2023, 12, 14),
      description: "This is a medium box of veggies",
    )
  ];

  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);
  static const grey800 = Color(0xFF424242);

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
