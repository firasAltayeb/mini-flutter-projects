import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/size_config.dart';
import 'package:food_boxes/widgets/no_ticket_container.dart';
import 'package:food_boxes/widgets/stacked_cards.dart';

import '../model/food_box.dart';
import '../utility/ticket_list_notifier.dart';

class TicketsPage extends ConsumerWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketList = ref.watch(ticketListProvider);
    final groupedBoxesByDate =
        ref.watch(ticketListProvider.notifier).getBoxesForDate();
    if (ticketList.isEmpty) {
      return NoTicketContainer();
    }
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.scaledHeight(7.5),
        ),
        itemCount: groupedBoxesByDate.keys.length,
        itemBuilder: (_, index) {
          Set<FoodBox> uniqueTickets =
              Set.from(groupedBoxesByDate.values.elementAt(index));
          List<FoodBox> uniqueTicketsForDate = uniqueTickets.toList();
          return StackedCards(
            uniqueBoxes: uniqueTicketsForDate,
          );
        },
      ),
    );
  }
}
