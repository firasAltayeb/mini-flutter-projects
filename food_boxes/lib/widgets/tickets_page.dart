import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/food_box.dart';
import '../utility/dimension_extensions.dart';
import '../utility/ticket_list_notifier.dart';
import 'no_ticket_container.dart';
import 'stacked_cards.dart';

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
    return ListView.builder(
      padding: EdgeInsets.only(
        top: context.percentHeight(10),
      ),
      itemCount: groupedBoxesByDate.keys.length,
      itemBuilder: (_, index) {
        Set<FoodBox> uniqueTickets =
            Set.from(groupedBoxesByDate.values.elementAt(index));
        List<FoodBox> uniqueTicketsForDate = uniqueTickets.toList();
        return StackedCards(
          uniqueTickets: uniqueTicketsForDate,
        );
      },
    );
  }
}
