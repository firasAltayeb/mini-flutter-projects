import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';
import '../widgets/expenses_chart.dart';
import '../models/transaction.dart';
import '../constants.dart';

void addNewTransactionBttmSht({
  Function changeState,
  BuildContext ctx,
}) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return NewTransactions(
        addTx: (
          String txTitle,
          double txAmount,
          DateTime chosenDate,
        ) {
          final newTx = Transaction(
            title: txTitle,
            amount: txAmount,
            date: chosenDate,
            id: DateTime.now().toString(),
          );
          changeState(newTx);
        },
      );
    },
  );
}

PreferredSizeWidget systemAppropriateAppBar({
  Function changeHandler,
  BuildContext context,
}) {
  final addNewIconBtn = IconButton(
    icon: Icon(CupertinoIcons.add),
    onPressed: () {
      addNewTransactionBttmSht(
        changeState: changeHandler,
        ctx: context,
      );
    },
  );
  if (Platform.isIOS)
    return CupertinoNavigationBar(
      middle: const Text('Personal Expenses'),
      trailing: Material(
        child: addNewIconBtn,
      ),
    );
  else
    return AppBar(
      title: const Text('Personal Expenses'),
      actions: [
        addNewIconBtn,
      ],
    );
}

List<Transaction> get _recentTransations {
  return Constants.userTransations.where(
    (tx) {
      if (tx.date == null) tx.date = DateTime.now();
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    },
  ).toList();
}

List<Widget> orientationAppropriateBody({
  MediaQueryData mediaQuery,
  Function changeState,
  Function deleteTx,
  double scrnHeight,
  bool showChart,
}) {
  if (mediaQuery.orientation == Orientation.landscape)
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
          ),
          Switch.adaptive(
            activeColor: Colors.yellow,
            onChanged: changeState,
            value: showChart,
          )
        ],
      ),
      Container(
        height: scrnHeight * 0.7,
        child: showChart
            ? ExpensesChart(
                recentTransactions: _recentTransations,
              )
            : TransactionList(
                transations: Constants.userTransations,
                deleteTx: deleteTx,
              ),
      ),
    ];
  else
    return [
      Container(
        height: scrnHeight * 0.3,
        child: ExpensesChart(
          recentTransactions: _recentTransations,
        ),
      ),
      Container(
        height: scrnHeight * 0.7,
        child: TransactionList(
          transations: Constants.userTransations,
          deleteTx: deleteTx,
        ),
      ),
    ];
}
