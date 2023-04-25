import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';
import 'auth_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const String routeName = "reset";

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitFormData() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        messegeSnackBar("Please follow the directions sent to your email"),
      );
      Navigator.of(context).pushNamed(AuthenticationScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(5),
          horizontal: SizeConfig.scaledWidth(10),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "Please enter your email to proceed",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: SizeConfig.scaledHeight(5),
              ),
              CustomTxtFormField(
                validator: (value) {
                  if (value.isEmpty) return "Please enter your email";
                  return null;
                },
                prefixIconWidget: Icon(Icons.email),
                label: "Email",
              ),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.scaledHeight(1)),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _submitFormData,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Submit"),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remembered your Password?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Go back"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
