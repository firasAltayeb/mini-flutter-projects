import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../screens/reg_screen.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_functions.dart';
import 'custom_txt_field.dart';

class EmailPasswordPage extends StatefulWidget {
  const EmailPasswordPage({
    required this.titleText,
    required this.subtitle,
    super.key,
  });

  final String titleText;
  final String subtitle;

  @override
  State<EmailPasswordPage> createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? currentRoute;

  void _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => isLoading = true);
        if (currentRoute == RegisterationScreen.routeName) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          if (mounted) {
            Navigator.of(context).pop();
          }
        } else {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
        }
      } on FirebaseAuthException catch (e) {
        print("Failed with error code: ${e.code}");
        FocusManager.instance.primaryFocus?.unfocus();
        String snackBarMessege;
        if (e.code == "invalid-email") {
          snackBarMessege = "Invalid email";
        } else if (e.code == "user-not-found") {
          snackBarMessege = "User does not exist";
        } else if (e.code == "wrong-password") {
          snackBarMessege = "Incorrect password";
        } else if (e.code == "email-already-in-use") {
          snackBarMessege = "An account already exists with this email";
        } else {
          snackBarMessege = e.message!;
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            messegeSnackBar(
              context,
              snackBarMessege,
              timeUp: 1750,
            ),
          );
        }
      } catch (e) {
        print("Caught exception: $e");
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    currentRoute = ModalRoute.of(context)!.settings.name!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            widget.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppConstants.grey500,
                ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.percentHeight(5),
              bottom: context.percentHeight(2),
            ),
            child: CustomTxtFormField(
              controller: _emailController,
              validator: (value) {
                if (value.trim().isEmpty || !value.contains('@')) {
                  return "Please enter your email";
                }
                return null;
              },
              prefixIconWidget: Icon(Icons.email),
              decorationLabel: "Email",
            ),
          ),
          CustomTxtFormField(
            controller: _passwordController,
            validator: (value) {
              if (value.trim().isEmpty) return "Please enter your password";
              if (currentRoute == RegisterationScreen.routeName &&
                  value.length > 64 &&
                  value.length < 6) {
                return "Password must be between 6 and 64 characters)";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            obscureText: true,
            decorationLabel: "Password",
          ),
          Container(
            padding: EdgeInsets.only(
              top: context.percentHeight(1),
            ),
            alignment: Alignment.center,
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  )
                : ElevatedButton(
                    onPressed: _submitFormData,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: context.percentHeight(2),
                          ),
                        ),
                        SizedBox(
                          width: context.percentWidth(1),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: context.percentHeight(2),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
