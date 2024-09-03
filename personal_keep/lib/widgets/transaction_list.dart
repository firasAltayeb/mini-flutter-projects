import 'package:flutter/material.dart';
import 'package:personal_keep/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Material(
              child: Column(
                children: [
                  Text("No transactions added yet."),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        : ListView(
            children: transactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTx: deleteTx,
                  ),
                )
                .toList(),
          );
  }
}
