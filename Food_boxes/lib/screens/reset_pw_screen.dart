import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../utility/size_config.dart';
import 'auth_screen.dart';

class ResetPwScreen extends StatefulWidget {
  const ResetPwScreen({super.key});

  static const String routeName = "reset";

  @override
  State<ResetPwScreen> createState() => _ResetPwScreenState();
}

class _ResetPwScreenState extends State<ResetPwScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(AuthScreen.routeName);
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
          vertical: SizeConfig.safeHeight * 0.1,
          horizontal: SizeConfig.safeWidth * 0.1,
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
                height: SizeConfig.safeHeight * 0.03,
              ),
              CstTextFormField(
                validator: (value) {
                  String newEmail = _emailController.text;
                  if (newEmail.isEmpty) return "This value must be filled";
                  return null;
                },
                prefixIconWidget: Icon(Icons.email),
                controller: _emailController,
                label: "Email",
              ),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.safeHeight * 0.01),
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
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Go back"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
