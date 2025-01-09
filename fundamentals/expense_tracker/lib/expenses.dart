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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: showModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("Charts"),
          Expanded(child: ExpensesList(expenses: _expenses))
        ],
      ),
    );
  }
}
