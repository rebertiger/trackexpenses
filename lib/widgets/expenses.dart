import 'package:flutter/material.dart';
import 'package:trackexpenses/widgets/chart/chart.dart';
import 'package:trackexpenses/widgets/expenses_list/expenses_list.dart';
import 'package:trackexpenses/models/expense.dart';
import 'package:trackexpenses/widgets/new_expense.dart';
import 'package:trackexpenses/database_helper.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _expenses = [];

  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final db = DatabaseHelper();
    final expenses = await db.getExpenses();
    setState(() {
      _expenses = expenses;
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) async {
    final db = DatabaseHelper();
    await db.insertExpense(expense);
    _loadExpenses();
  }

  void _removeExpense(Expense expense) async {
    final expenseIndex = _expenses.indexOf(expense);
    final db = DatabaseHelper();
    await db.deleteExpense(expense.id);
    setState(() {
      var removeExpenseSnackbar = SnackBar(
        content: const Text('Your expense was successfully deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _expenses.insert(expenseIndex, expense);
              });
            }),
      );
      ScaffoldMessenger.of(context).showSnackBar(removeExpenseSnackbar);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No expenses found, start adding some!"),
    );
    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _expenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 123, 227),
        title: const Text(
          "TrackExpenses",
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: deviceWidth < 600
          ? Column(
              children: [
                Chart(expenses: _expenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _expenses),
                ),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
