import 'package:Personal_keep/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transations;
  final Function deleteTx;

  TransactionList(this.transations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transations.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
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
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transation: transations[index], deleteTx: deleteTx);
            },
            itemCount: transations.length,
          );
  }
}
