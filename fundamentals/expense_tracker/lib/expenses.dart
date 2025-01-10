import 'package:expense_tracker/components/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/components/modal.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
        title: 'Expenses Cinema',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Expenses food',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Expenses traveling',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Expenses goig to cinema',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Modal(
          addExpense: _saveExpense,
        );
      },
      isScrollControlled: true,
    );
  }

  void _saveExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
    Navigator.pop(context);
  }

  void _removeExpense(Expense expense) {
    final expensIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 4),
      content: Text("Expense deleted"),
      action: SnackBarAction(label: "Undo", onPressed: () {
        setState(() {
          _expenses.insert(expensIndex, expense);
        });
      }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No expenses founded"),
    );

    if (_expenses.isNotEmpty) {
      content = ExpensesList(
        expenses: _expenses,
        deleteExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: showModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Text("Charts"), Expanded(child: content)],
      ),
    );
  }
}
