import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${transations[index].amount}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transations[index].title,
                    style: TextStyle(fontFamily: 'OpenSans'),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transations[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                          textColor: Colors.red,
                          onPressed: () => deleteTx(transations[index].id),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => deleteTx(transations[index].id),
                        ),
                ),
              );
            },
            itemCount: transations.length,
          );
  }
}
