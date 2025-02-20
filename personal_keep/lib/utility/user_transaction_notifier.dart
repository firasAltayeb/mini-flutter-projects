import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/constants.dart';

import '../models/transaction.dart';

final userTransactionsProvider =
    NotifierProvider<TransactionListNotifier, List<Transaction>>(
        TransactionListNotifier.new);

class TransactionListNotifier extends Notifier<List<Transaction>> {
  @override
  build() => AppConstants.userTransactions;

  void deleteTransaction(String id) {
    state = [...state..removeWhere((tx) => tx.id == id)];
  }

  void addTransaction(
    String title,
    double amount,
    DateTime? chosenDate,
  ) {
    final newTx = Transaction(
      id: DateTime.now.toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );
    state = [...state, newTx];
  }

  List<Transaction> get recentTransactions {
    return state.where(
      (tx) {
        tx.date ??= DateTime.now();
        return tx.date!.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }
}
