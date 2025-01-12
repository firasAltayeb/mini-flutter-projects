import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utility/home_functions.dart';
import 'package:personal_keep/widgets/expenses_chart.dart';

import '../widgets/transaction_list.dart';

class LandscapePage extends ConsumerStatefulWidget {
  const LandscapePage({
    required this.screenHeight,
    super.key,
  });

  final double screenHeight;

  @override
  ConsumerState<LandscapePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<LandscapePage> {
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {
    final userTransactions = ref.watch(userTransactionProvider);
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
          height: widget.screenHeight * 0.7,
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
