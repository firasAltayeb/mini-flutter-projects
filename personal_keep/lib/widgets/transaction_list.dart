import 'package:flutter/material.dart';

import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.transations,
    required this.deleteTx,
  });

  final List<Transaction> transations;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    if (transations.isEmpty)
      return LayoutBuilder(
        builder: (ctx, constraints) {
          return Material(
            child: Column(
              children: [
                const Text('No transactions added yet!'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      );
    else
      return ListView(
        children: transations
            .map(
              (tx) => TransactionItem(
                key: ValueKey(tx.id),
                transation: tx,
                deleteTx: deleteTx,
              ),
            )
            .toList(),
      );
  }
}
