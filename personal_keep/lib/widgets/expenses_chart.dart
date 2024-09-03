import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_keep/models/transaction.dart';
import 'package:personal_keep/widgets/chart_bar.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<Map<String, dynamic>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date?.day == weekDay.day &&
            recentTransactions[i].date?.month == weekDay.month &&
            recentTransactions[i].date?.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal:
                    totalSpending == 0.0 ? 0.0 : data['amount'] / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
