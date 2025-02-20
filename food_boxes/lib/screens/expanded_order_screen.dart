import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/dimension_extensions.dart';
import '../utility/shared_functions.dart';
import '../utility/shared_providers.dart';
import '../utility/ticket_list_notifier.dart';
import '../widgets/ticket_card.dart';

class ExpandedOrderScreen extends ConsumerWidget {
  const ExpandedOrderScreen({super.key});

  static const routeName = "order";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketListNotifier = ref.watch(ticketListProvider.notifier);
    final stackedTicketListController =
        ref.watch(stackedTicketProvider.notifier);
    final ticketList = ref.watch(ticketListProvider);
    final stackedTickets = ref.watch(stackedTicketProvider);
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: context.percentHeight(10),
        ),
        itemCount: stackedTickets.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => orderDetailsDialogue(
              context,
              ticketListNotifier,
              stackedTicketListController,
              ticketList,
              ticket: stackedTickets[index],
            ),
            child: Center(
              child: TicketCard(
                uniqueTicket: stackedTickets[index],
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
