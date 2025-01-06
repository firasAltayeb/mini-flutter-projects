import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utility/home_functions.dart';
import 'package:personal_keep/widgets/expenses_chart.dart';

import '../widgets/transaction_list.dart';

class PortraitPage extends ConsumerWidget {
  const PortraitPage({
    required this.pageHeight,
    super.key,
  });

  final double pageHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTransactions = ref.watch(userTransactionProvider);
    final recentTransactions = ref.watch(recentTransactionsProvider);
    return Column(
      children: [
        Container(
          height: pageHeight * 0.3,
          child: ExpenseChart(
            recentTransactions: recentTransactions,
          ),
        ),
        Container(
          height: pageHeight * 0.7,
          child: TransactionList(
            transactions: userTransactions,
          ),
        ),
      ],
    );
  }
}
