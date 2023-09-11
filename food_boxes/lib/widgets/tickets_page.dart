import 'package:flutter/material.dart';
import 'package:food_boxes/app_constants.dart';
import 'package:food_boxes/utility/shared_functions.dart';
import 'dart:math';

import '../app_icons.dart';
import '../utility/size_config.dart';

final _rng = Random();

int randomValue(int min, int max) {
  return min + _rng.nextInt(max - min);
}

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  Widget innerRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
        SizedBox(
          width: SizeConfig.scaledWidth(3),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.5),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => orderDetailsDialogue(
            context,
            orderNumber: "${index + 1}",
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: AppConstants.circleRadius,
            ),
            elevation: 4,
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(1.5),
              horizontal: SizeConfig.scaledWidth(3),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeConfig.scaledHeight(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.ticketImages[randomValue(0, 7)],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: SizeConfig.scaledHeight(2),
                      right: SizeConfig.scaledWidth(1),
                      child: Container(
                        width: SizeConfig.scaledWidth(70),
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.scaledHeight(1),
                          horizontal: SizeConfig.scaledWidth(1.5),
                        ),
                        color: Colors.black54,
                        child: Text(
                          "Hawaii Toast",
                          style: TextStyle(
                            fontSize: SizeConfig.scaledHeight(3.5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.scaledHeight(3),
                    horizontal: SizeConfig.scaledWidth(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      innerRow(AppIcons.calendar, "5/23/23"),
                      innerRow(Icons.attach_money, "5.00"),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
