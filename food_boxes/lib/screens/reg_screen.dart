import 'package:flutter/material.dart';

import '../utility/dimension_extensions.dart';
import '../widgets/email_pw_page.dart';
import 'auth_screen.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});
  static const String routeName = "reg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: context.percentHeight(10),
          horizontal: context.percentWidth(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailPasswordPage(
              titleText: "Sign Up",
              subtitle: "Please sign up to proceed",
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AuthenticationScreen.routeName);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: context.percentHeight(2),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
