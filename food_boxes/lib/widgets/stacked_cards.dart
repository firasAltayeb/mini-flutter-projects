import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/screens/expanded_order_screen.dart';
import 'package:food_boxes/widgets/ticket_card.dart';

import '../model/food_box.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';

class StackedCards extends ConsumerWidget {
  const StackedCards({
    super.key,
    required this.uniqueBoxes,
  });

  final List<FoodBox> uniqueBoxes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: uniqueBoxes.length == 1
          ? () => orderDetailsDialogue(ref, orderNumber: "${1234}")
          : () {
              Navigator.pushNamed(
                context,
                ExpandedOrderScreen.routeName,
                arguments: uniqueBoxes,
              );
            },
      child: SizedBox(
        height: SizeConfig.scaledHeight(45),
        width: SizeConfig.scaledWidth(90),
        child: Stack(
          children: [
            for (int index = 0; index < uniqueBoxes.length; index++)
              Positioned(
                bottom: SizeConfig.scaledHeight(0.5 + 1.5 * index),
                child: TicketCard(
                  uniqueTicket: uniqueBoxes.elementAt(index),
                  index: index,
                ),
              )
          ],
        ),
      ),
    );
  }
}
