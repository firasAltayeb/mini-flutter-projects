import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  // String titleInput;
  // String amountInput;
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransactions(this.addTx);

  void submitData() {
    print(titleController.text);
    print(amountController.text);
    addTx(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData,
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
