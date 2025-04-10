import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class ExpenseItem extends StatelessWidget {

  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            SizedBox(height: 4,),
            Row(
              children: [
                Text('R\$ ${expense.amount.toStringAsFixed(2)}'), // 99.1234 => 99.12
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formatedDate)
                  ],
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}