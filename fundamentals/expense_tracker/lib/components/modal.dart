import 'package:flutter/material.dart';

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


  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
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
            decoration: InputDecoration(
              label: Text("Title")
            ),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              label: Text("Amount"),
              prefixText: "R\$ "
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              ElevatedButton(onPressed: (){
                print(_titleController.text);
                print(_amountController.text);
                Navigator.pop(context);

              }, child: const Text("Save expense")),
              const Spacer(),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel"))
            ],
          )

        ],
      ),
    );
  }
}
