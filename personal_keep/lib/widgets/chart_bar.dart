import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.spendingAmount,
    required this.percentageOfTotal,
    required this.label,
  });

  final double spendingAmount;
  final double percentageOfTotal;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * 0.05,
              ),
              child: SizedBox(
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth * 0.25,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: const Color(0xFFDCDCDC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentageOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)),
            ),
          ],
        );
      },
    );
  }
}
