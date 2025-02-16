import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_keep/utility/shared_functions.dart';
import 'package:personal_keep/widgets/custom_text_field.dart';

import '../utility/shared_providers.dart';
import 'adaptive_button.dart';

class NewTransaction extends ConsumerStatefulWidget {
  const NewTransaction({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends ConsumerState<NewTransaction> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  void _submitData() {
    if (_formKey.currentState!.validate() == false) return;

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        getSnackBar("Please select a date.", timeUp: 1000),
      );
      return;
    }
    final enteredAmount = double.parse(_amountController.text);
    final title = _titleController.text;

    addTransaction(ref, title, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 365),
      ),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, mediaQuery.viewInsets.bottom),
      child: SizedBox(
        height: mediaQuery.orientation == Orientation.landscape
            ? mediaQuery.size.height * 0.75
            : mediaQuery.size.height * 0.45,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTxtFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Please enter a title.";
                  }
                  return null;
                },
                decorationLabel: "Title",
              ),
              CustomTxtFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                ],
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                controller: _amountController,
                validator: (value) {
                  if (value.trim().isEmpty ||
                      (double.parse(value.trim()) < 1 &&
                          double.parse(value.trim()) > 0)) {
                    return "Amount greater than zero.";
                  }
                  return null;
                },
                decorationLabel: "Amount",
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No date chosen"
                            : "Picked date: ${DateFormat.yMd().format(
                                _selectedDate!,
                              )}",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    AdaptiveButton(
                      text: "Choose date",
                      handler: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: AdaptiveButton(
                  text: "Add transaction",
                  handler: _submitData,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
