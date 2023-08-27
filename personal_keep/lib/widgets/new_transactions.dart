import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../utility/home_functions.dart';
import '../widgets/adaptive_button.dart';
import 'custom_text_field.dart';

class NewTransactions extends StatefulWidget {
  NewTransactions({required this.addTx}) {
    print('New transaction widget');
  }

  final Function addTx;

  @override
  _NewTransactionsState createState() {
    print('NewTransaction widget CreateState');
    return _NewTransactionsState();
  }
}

class _NewTransactionsState extends State<NewTransactions> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  _NewTransactionsState() {
    print('NewTransaction constructor state');
  }

  @override
  void initState() {
    print('NewTransaction initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didUpdateWidget');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate() == false) return;

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        messageSnackBar("Please select a date", timeUp: 1000),
      );
      return;
    }
    final enteredAmount = double.parse(_amountController.text);
    final enteredTitle = _titleController.text;

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTxtFormField(
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  decorationLabel: 'title',
                  controller: _titleController,
                ),
                CustomTxtFormField(
                  validator: (value) {
                    if (value.trim().isEmpty ||
                        double.parse(value.trim()) < 1) {
                      return "Please enter an amount greater than 0";
                    }
                    return null;
                  },
                  decorationLabel: 'amount',
                  controller: _amountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No Date chosen!'
                              : 'Picked Date: '
                                  '${DateFormat.yMd().format(_selectedDate!)}',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      AdaptiveFlatButton('Choose Date', _presentDatePicker),
                    ],
                  ),
                ),
                AdaptiveFlatButton("add transactions", _submitData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
