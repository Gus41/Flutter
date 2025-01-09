import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Modal extends StatefulWidget {
  const Modal({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<Modal> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _date;
  Category _category = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime.now());

    setState(() {
      _date = date;
    });
  }



  void _submitData(){
    final enteredAmount = double.tryParse(_amountController.text); //return a double or null
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if(_titleController.text.trim().isEmpty  || amountIsInvalid || _date == null){
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Please make sure a valid title, amount, date and category was entered"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text("Okay"))
          ],
        );
      });
      return;
    }

    widget.addExpense(Expense(title: _titleController.text,
     amount: enteredAmount, date: _date!, category: _category)
    );

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: _amountController,
                decoration:
                    InputDecoration(label: Text("Amount"), prefixText: "R\$ "),
                keyboardType: TextInputType.number,
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_date == null
                      ? 'No date selected'
                      : formatter.format(_date!)),
                  IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _category,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.name.toString())))
                      .toList(),
                  onChanged: (value) {
                    if(value == null){
                      return;
                    }
                    setState(() {
                      _category = value;
                    });

                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: _submitData,
                  child: const Text("Save expense")),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ],
          )
        ],
      ),
    );
  }
}
