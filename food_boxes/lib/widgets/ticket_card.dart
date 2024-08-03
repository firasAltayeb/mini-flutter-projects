import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/shared_providers.dart';

import '../app_constants.dart';
import '../app_icons.dart';
import '../model/food_box.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';
import '../utility/ticket_list_notifier.dart';

class TicketCard extends ConsumerWidget {
  const TicketCard({
    super.key,
    required this.uniqueTicket,
    required this.index,
    this.ticketHeightScale = 35,
  });

  final FoodBox uniqueTicket;
  final int index;
  final double ticketHeightScale;

  Widget innerRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
          size: SizeConfig.scaledHeight(2.25),
        ),
        SizedBox(
          width: SizeConfig.scaledWidth(2.75),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.25),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketQuantity = ref
        .read(ticketListProvider.notifier)
        .getNumberOfTickets(uniqueTicket.id);
    final imageURL = ref.read(imageUrlProvider(uniqueTicket));
    return SizedBox(
      height: SizeConfig.scaledHeight(ticketHeightScale),
      width: SizeConfig.scaledWidth(90),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        elevation: 4,
        margin: EdgeInsets.only(
          bottom: SizeConfig.scaledHeight(2.5),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: SizeConfig.scaledHeight(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(imageURL),
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
                      "${uniqueTicket.name} x$ticketQuantity",
                      style: TextStyle(
                        fontSize: SizeConfig.scaledHeight(3),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.scaledHeight(1.5),
                horizontal: SizeConfig.scaledWidth(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  innerRow(
                    AppIcons.calendar,
                    formatDate(uniqueTicket.date),
                  ),
                  innerRow(
                    Icons.attach_money,
                    (uniqueTicket.price * ticketQuantity).toStringAsFixed(2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
