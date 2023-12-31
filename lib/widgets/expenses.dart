import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/exp_list/expenses_list.dart';
import 'package:expense_tracker/widgets/user_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  double totalExpense = 0;

  Map<Category, double?> mp = {
    for (var i in Category.values) i: 0,
  };

  final List<ExpenseModel> expensesMade = [
    // ExpenseModel(
    //     title: "DAA File",
    //     amount: 100,
    //     date: DateTime.now(),
    //     category: Category.college),
    // ExpenseModel(
    //     title: "Maggi",
    //     amount: 25,
    //     date: DateTime.now(),
    //     category: Category.food),
  ];

  void addExpense(ExpenseModel expense) {
    setState(() {
      expensesMade.add(expense);
      mp = {
        for (var i in Category.values)
          i: (expense.category == i) ? mp[i]! + expense.amount : mp[i],
      };
    });

    totalExpense += expense.amount;
  }

  void removeExpense(ExpenseModel expense) {
    final expenseIndex = expensesMade.indexOf(expense);
    setState(() {
      expensesMade.remove(expense);
      mp = {
        for (var i in Category.values)
          i: (expense.category == i) ? mp[i]! - expense.amount : mp[i],
      };
    });

    totalExpense -= expense.amount;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 2),
          content: const Text("Expense deleted"),
          action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                setState(() {
                  expensesMade.insert(expenseIndex, expense);
                  mp = {
                    for (var i in Category.values)
                      i: (expense.category == i)
                          ? mp[i]! + expense.amount
                          : mp[i],
                  };
                  totalExpense += expense.amount;
                });
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/main.jpg"),
          const SizedBox(
            height: 10,
          ),
          const Text("No expense found! Start adding :)"),
        ],
      ),
    );

    if (expensesMade.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expensesMade,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker App"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => NewExpense(
                          addexpense: addExpense,
                        ));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => ExpenseChart(
                        mp: mp,
                        totalexpense: totalExpense,
                      ));
            },
            child: const Text("Show Chart"),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
