import 'package:Personal_keep/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transation,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transation;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
                '\$${transation.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          transation.title,
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transation.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Colors.red,
                onPressed: () => deleteTx(transation.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => deleteTx(transation.id),
              ),
      ),
    );
  }
}
