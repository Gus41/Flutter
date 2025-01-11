import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/components/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this. deleteExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) deleteExpense;

  @override
  Widget build(BuildContext context) {
    //only creates an item if the item is about to be visible
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withAlpha(100),
              margin: Theme.of(context).cardTheme.margin,
              
            ),
            
            onDismissed: (direction) => {
              deleteExpense(expenses[index])
            },
            key: ValueKey(expenses[index]), child: ExpenseItem(expense: expenses[index])
            )
        );
  }
}
