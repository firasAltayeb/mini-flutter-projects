import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utility/shared_functions.dart';
import '../screens/home_screen.dart';
import '../screens/auth_screen.dart';
import '../utility/size_config.dart';
import '../screens/reg_screen.dart';
import 'custom_text_field.dart';

class EmailPasswordPage extends StatefulWidget {
  const EmailPasswordPage({
    required this.titleText,
    required this.subTitle,
    super.key,
  });

  final String titleText;
  final String subTitle;

  @override
  State<EmailPasswordPage> createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool submitClicked = false;
  String? currentRoute;

  void _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (currentRoute == AuthenticationScreen.routeName) {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            password: _passwordController.text,
            email: _emailController.text,
          );
        }
        if (currentRoute == RegisterationScreen.routeName) {
          setState(() => submitClicked = true);
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            password: _passwordController.text,
            email: _emailController.text,
          );
        }
        if (context.mounted) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        FocusManager.instance.primaryFocus?.unfocus();
        String snackBarMsg;
        if (e.code == 'wrong-password') {
          snackBarMsg = 'The password provided is wrong.';
        } else if (e.code == 'weak-password') {
          snackBarMsg = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          snackBarMsg = 'An account already exists for that email.';
        } else if (e.code == 'user-not-found') {
          snackBarMsg = 'No user with this email exist';
        } else {
          snackBarMsg = e.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(snackBarMsg, timeUp: 2000),
        );
        setState(() => submitClicked = false);
      } catch (e) {
        setState(() => submitClicked = false);
        print(e);
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
            widget.subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: SizeConfig.safeHeight * 0.04,
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.trim().isEmpty || !value.contains('@')) {
                return "Please enter a valid email address";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.email),
            controller: _emailController,
            label: "Email",
          ),
          SizedBox(
            height: SizeConfig.safeHeight * 0.01,
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.trim().length < 6) {
                return "Password must be at least 6 characters long";
              }
              if (currentRoute == RegisterationScreen.routeName &&
                  value.length > 64) {
                return "Password is too long";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            controller: _passwordController,
            hideLabelOnFocus: true,
            obscureText: true,
            label: "Password",
          ),
          Container(
            padding: EdgeInsets.only(
              top: SizeConfig.safeHeight * 0.01,
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: !submitClicked ? _submitFormData : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Submit"),
                  SizedBox(
                    width: SizeConfig.safeWidth * 0.01,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
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
