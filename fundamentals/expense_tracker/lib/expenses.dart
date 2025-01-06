import 'package:expense_tracker/components/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

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
        title: 'title',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'title',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'title',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'title',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 172, 172),
      body: Column(
        children: [
          Text("Charts"),
          Expanded(child: ExpensesList(expenses: _expenses))
        ],
      ),
    );
  }
}
