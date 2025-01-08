import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final formatter = DateFormat.yMd();

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _date;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {

    final date = await showDatePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime.now()
      );

    setState(() {
      _date = date;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
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
                      Text(_date == null? 'No date selected' : formatter.format(_date!)),
                      IconButton(
                          onPressed: _showDatePicker, icon: const Icon(Icons.calendar_month))
                    ],
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Save expense")),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
