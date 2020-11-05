import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transations.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransations = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 120.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Sex toys',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransactions(),
      TransactionList(_userTransations),
    ]);
  }
}
