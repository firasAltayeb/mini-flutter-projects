import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/widgets/expenses_chart.dart';

import '../utility/user_transaction_notifier.dart';
import '../widgets/transaction_list.dart';

class PortraitPage extends ConsumerWidget {
  const PortraitPage({
    required this.pageHeight,
    super.key,
  });

  final double pageHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTxNotifier = ref.watch(userTransactionsProvider.notifier);
    final userTransactions = ref.watch(userTransactionsProvider);
    return Column(
      children: [
        SizedBox(
          height: pageHeight * 0.3,
          child: ExpenseChart(
            recentTransactions: userTxNotifier.recentTransactions,
          ),
        ),
        SizedBox(
          height: pageHeight * 0.7,
          child: TransactionList(
            transactions: userTransactions,
          ),
        ),
      ],
    );
  }
}
