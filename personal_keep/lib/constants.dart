import 'package:flutter/material.dart';

import 'models/transaction.dart';

abstract class AppConstants {
  static const availableColors = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.green
  ];

  static const grey500 = Color(0xFF9E9E9E);

  static List<Transaction> userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 120.99,
    ),
    Transaction(
      id: 't2',
      title: 'New socks',
      amount: 39.99,
    ),
    Transaction(
      id: 't3',
      title: 'New tv',
      amount: 520.99,
    ),
    Transaction(
      id: 't4',
      title: 'New table',
      amount: 169.99,
    ),
  ];
}
