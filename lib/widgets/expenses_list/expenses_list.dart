import 'package:flutter/material.dart';
import 'package:trackexpenses/models/expense.dart';
import 'package:trackexpenses/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          movementDuration: const Duration(milliseconds: 70),
              resizeDuration: const Duration(milliseconds: 70),
              background: Container(
                color: Colors.red,
                margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete,color: Colors.white,),
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) => onRemoveExpense(expenses[index]),
              child: ExpenseItem(expense: expenses[index]),
            ));
  }
}
