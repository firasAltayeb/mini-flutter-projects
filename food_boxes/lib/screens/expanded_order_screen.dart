import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/shared_functions.dart';
import 'package:food_boxes/utility/shared_providers.dart';

import '../utility/size_config.dart';
import '../widgets/ticket_card.dart';

class ExpandedOrderScreen extends ConsumerWidget {
  const ExpandedOrderScreen({super.key});

  static const routeName = "order";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stackedTicket = ref.watch(stackedTicketProvider);
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.scaledHeight(10),
        ),
        itemCount: stackedTicket.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () =>
                orderDetailsDialogue(ref, ticket: stackedTicket[index]),
            child: Center(
              child: TicketCard(
                uniqueTicket: stackedTicket[index],
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
