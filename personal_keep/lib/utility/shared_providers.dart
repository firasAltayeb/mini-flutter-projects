import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/constants.dart';

import '../models/transaction.dart';

final userTransactionsProvider =
    StateProvider<List<Transaction>>((ref) => AppConstants.userTransactions);

void deleteTransaction(WidgetRef ref, String id) {
  ref.read(userTransactionsProvider.notifier).update(
        (state) => [...state..removeWhere((tx) => tx.id == id)],
      );
}

void addTransaction(
  WidgetRef ref,
  String title,
  double amount,
  DateTime? chosenDate,
) {
  final newTx = Transaction(
    id: DateTime.now().toString(),
    title: title,
    amount: amount,
    date: chosenDate,
  );
  ref.read(userTransactionsProvider.notifier).update(
        (state) => [...state, newTx],
      );
}

final recentTransactionsProvider = Provider<List<Transaction>>((ref) {
  return ref.watch(userTransactionsProvider).where(
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
