import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/widgets/expenses_chart.dart';

import '../utility/shared_providers.dart';
import '../widgets/transaction_list.dart';

class LandscapePage extends ConsumerStatefulWidget {
  const LandscapePage({
    required this.pageHeight,
    super.key,
  });

  final double pageHeight;

  @override
  ConsumerState<LandscapePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<LandscapePage> {
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final userTransactions = ref.watch(userTransactionsProvider);
    final recentTransactions = ref.watch(recentTransactionsProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show chart",
              style: TextStyle(
                fontFamily: "OpenSans",
              ),
            ),
            Switch.adaptive(
              value: _showChart,
              onChanged: (val) => setState(() => _showChart = val),
              activeColor: Colors.yellow,
            )
          ],
        ),
        Container(
          height: widget.pageHeight * 0.7,
          child: _showChart
              ? ExpenseChart(
                  recentTransactions: recentTransactions,
                )
              : TransactionList(
                  transactions: userTransactions,
                ),
        )
      ],
    );
  }
}
