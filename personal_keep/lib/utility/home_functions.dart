import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/constants.dart';
import 'package:personal_keep/widgets/new_transactions.dart';

import '../models/transaction.dart';

final userTransactionProvider =
    StateProvider<List<Transaction>>((ref) => AppConstants.userTransactions);

final recentTransactionsProvider = Provider<List<Transaction>>((ref) {
  return ref.watch(userTransactionProvider).where(
    (tx) {
      tx.date ??= DateTime.now();
      return tx.date!.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    },
  ).toList();
});

SnackBar getSnackBar(String message, {int timeUp = 500}) {
  return SnackBar(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    duration: Duration(milliseconds: timeUp),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: 50,
      right: 50,
      bottom: 20,
    ),
  );
}

void addNewTxBottomSheet(WidgetRef ref) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: ref.context,
    builder: (_) {
      return NewTransaction(
        function: (String title, double amount, DateTime chosenDate) {
          // ignore: unused_local_variable
          final newTx = Transaction(
            id: DateTime.now().toString(),
            title: title,
            amount: amount,
            date: chosenDate,
          );
          ref.read(userTransactionProvider.notifier).update(
                (state) => [
                  ...state,
                  newTx,
                ],
              );
        },
      );
    },
  );
}

void deleteTransaction(WidgetRef ref, String id) {
  ref.read(userTransactionProvider.notifier).update(
        (state) => [...state..removeWhere((tx) => tx.id == id)],
      );
}
