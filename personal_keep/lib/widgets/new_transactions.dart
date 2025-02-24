import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_keep/utility/shared_functions.dart';
import 'package:personal_keep/widgets/custom_text_field.dart';

import '../utility/user_transaction_notifier.dart';
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
  bool? _datePickerUsed;

  void _submitData() {
    if (_formKey.currentState!.validate() == false || _selectedDate == null) {
      showSnackBar("Please ensure all fields are provided");
      if (_datePickerUsed == null) {
        setState(() => _datePickerUsed = false);
      }
    } else {
      final amount = double.parse(_amountController.text);
      final title = _titleController.text;

      final userTxNotifier = ref.read(userTransactionsProvider.notifier);
      userTxNotifier.addTransaction(title, amount, _selectedDate);

      Navigator.of(context).pop();
    }
  }

  void _chooseDateHandler() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 6)),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then(
      (date) {
        if (date != null) {
          setState(() {
            _selectedDate = date;
            _datePickerUsed = true;
          });
        }
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
                decorationLabel: "Title",
                controller: _titleController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Please enter a title";
                  }
                },
                verticalContentPadding:
                    mediaQuery.orientation == Orientation.landscape ? 5 : 10,
              ),
              CustomTxtFormField(
                decorationLabel: "Amount",
                controller: _amountController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) {
                  final temp = value.trim();
                  if (temp.isEmpty || double.parse(temp) <= 0) {
                    return "Amount should be greater than zero";
                  }
                },
                verticalContentPadding:
                    mediaQuery.orientation == Orientation.landscape ? 5 : 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No date chosen"
                            : "Picked date: ${DateFormat.yMd().format(
                                _selectedDate!,
                              )}",
                        style: TextStyle(
                          fontSize: _selectedDate == null ? 18 : 20,
                          color: _datePickerUsed != null &&
                                  _datePickerUsed == false
                              ? Color(0xFF8F211A)
                              : Color(0xFF000000),
                        ),
                      ),
                    ),
                    AdaptiveButton(
                      text: "Choose date",
                      handler: _chooseDateHandler,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
