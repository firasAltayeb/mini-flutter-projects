import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const String routeName = "reset";

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            messegeSnackBar("Please follow the directions sent to your email"),
          );
        }
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        String snackBarMsg;
        if (e.code == 'user-not-found') {
          snackBarMsg = 'No user with this email exist';
        } else if (e.code == "invalid-email") {
          snackBarMsg = "Invalid email";
        } else {
          snackBarMsg = e.message!;
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            messegeSnackBar(snackBarMsg, timeUp: 2000),
          );
        }
      } catch (e) {
        print(e);
      }
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
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
                controller: _emailController,
                decorationLabel: "Email",
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(1),
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _submitFormData,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: SizeConfig.scaledHeight(2.0),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.scaledWidth(1),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: SizeConfig.scaledHeight(2),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
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
                    child: Text(
                      "Go back",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: SizeConfig.scaledHeight(2.0),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
