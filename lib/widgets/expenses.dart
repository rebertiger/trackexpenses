import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackexpenses/widgets/expenses_list/expenses_list.dart';
import 'package:trackexpenses/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "New Mouse",
        amount: 40,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Holiday travel price",
        amount: 50,
        date: DateTime.now(),
        category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
