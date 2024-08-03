import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/food_box.dart';
import '../utility/size_config.dart';
import '../widgets/ticket_card.dart';

class ExpandedOrderScreen extends ConsumerWidget {
  const ExpandedOrderScreen({
    required this.foodBoxList,
    super.key,
  });

  static const routeName = "order";

  final List<FoodBox> foodBoxList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(3),
          horizontal: SizeConfig.scaledWidth(3),
        ),
        height: double.infinity,
        child: ListView.builder(
          padding: EdgeInsets.only(
            top: SizeConfig.scaledHeight(7.5),
          ),
          itemCount: foodBoxList.length,
          itemBuilder: (_, index) {
            return TicketCard(
              uniqueTicket: foodBoxList[index],
              index: index,
              ticketHeightScale: 45,
            );
          },
        ),
      ),
    );
  }
}
