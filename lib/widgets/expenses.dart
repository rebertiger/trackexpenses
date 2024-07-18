import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:trackexpenses/widgets/expenses_list/expenses_list.dart';
import 'package:trackexpenses/models/expense.dart';
import 'package:trackexpenses/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
      ToastContext().init(context);
      Toast.show(
        "Expense was successfully removed.",
        duration: Toast.lengthShort,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No expenses found, start adding some!"),);
    if (registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
            expenses: registeredExpenses,
            onRemoveExpense: _removeExpense,
          );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("TrackExpenses"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          
          Expanded(
              child: mainContent),
        ],
      ),
    );
  }
}
