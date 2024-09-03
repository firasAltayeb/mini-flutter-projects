import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utility/home_functions.dart';
import 'package:personal_keep/widgets/expenses_chart.dart';

import '../widgets/transaction_list.dart';

class PortraitPage extends ConsumerWidget {
  const PortraitPage({
    required this.appBarHeight,
    super.key,
  });

  final double appBarHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTransactions = ref.watch(userTransactionProvider);
    final recentTransactions = ref.watch(recentTransactionsProvider);
    final mediaQuery = MediaQuery.of(context);
    final barExcludedScrnHeight =
        mediaQuery.size.height - mediaQuery.padding.top - appBarHeight;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: barExcludedScrnHeight * 0.3,
              child: ExpenseChart(
                recentTransactions: recentTransactions,
              ),
            ),
            Container(
              height: barExcludedScrnHeight * 0.7,
              child: TransactionList(
                transactions: userTransactions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
