import 'package:expense_tracker/models/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({required this.totalexpense, required this.mp, super.key});

  final Map<Category, double?> mp;
  final double totalexpense;

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            "Total: Rs ${widget.totalexpense}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  title: "Food",
                  titleStyle: Theme.of(context).textTheme.titleLarge,
                  value: widget.mp[Category.food],
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                PieChartSectionData(
                  title: "Travel",
                  titleStyle: Theme.of(context).textTheme.titleLarge,
                  value: widget.mp[Category.travel],
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                PieChartSectionData(
                  title: "Leisure",
                  titleStyle: Theme.of(context).textTheme.titleLarge,
                  value: widget.mp[Category.leisure],
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                PieChartSectionData(
                  title: "College",
                  titleStyle: Theme.of(context).textTheme.titleLarge,
                  value: widget.mp[Category.college],
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
            swapAnimationDuration: const Duration(seconds: 2),
          ),
        ),
      ],
    );
  }
}
