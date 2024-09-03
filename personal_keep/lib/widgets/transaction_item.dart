import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_keep/constants.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late final Color _bgColor;

  @override
  void initState() {
    _bgColor = AppConstants.availableColors[Random().nextInt(
      AppConstants.availableColors.length,
    )];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "\$${widget.transaction.amount}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
            fontFamily: "OpenSans",
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            widget.transaction.date!,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              )
            : IconButton(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
      ),
    );
  }
}
