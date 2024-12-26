import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../app_icons.dart';
import '../model/food_box.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_functions.dart';
import '../utility/shared_providers.dart';
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

  Widget innerRow(BuildContext context, IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.black,
          size: context.percentHeight(2.25),
        ),
        SizedBox(
          width: context.percentWidth(2.75),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: context.percentHeight(2.25),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketList = ref.watch(ticketListProvider);
    final ticketQuantity =
        ticketList.where((e) => e.id == uniqueTicket.id).length;
    final imageURL = ref.read(imageUrlProvider(uniqueTicket));
    return SizedBox(
      height: context.percentHeight(ticketHeightScale),
      width: context.percentWidth(90),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        elevation: 4,
        margin: EdgeInsets.only(
          bottom: context.percentHeight(2.5),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: context.percentHeight(25),
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
                  bottom: context.percentHeight(2),
                  right: context.percentWidth(1),
                  child: Container(
                    width: context.percentWidth(70),
                    padding: EdgeInsets.symmetric(
                      vertical: context.percentHeight(1),
                      horizontal: context.percentWidth(1.5),
                    ),
                    color: Colors.black54,
                    child: Text(
                      "${uniqueTicket.name} x$ticketQuantity",
                      style: TextStyle(
                        fontSize: context.percentHeight(3),
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.percentHeight(1.5),
                horizontal: context.percentWidth(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  innerRow(
                    context,
                    AppIcons.calendar,
                    formatDate(uniqueTicket.date),
                  ),
                  innerRow(
                    context,
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
