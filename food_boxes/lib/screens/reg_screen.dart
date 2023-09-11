import 'package:flutter/material.dart';

import '../widgets/email_pass_page.dart';
import '../utility/size_config.dart';
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
          vertical: SizeConfig.safeHeight * 0.1,
          horizontal: SizeConfig.safeWidth * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailPasswordPage(
              subTitle: "Please sign up to proceed",
              titleText: "Sign Up",
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
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: SizeConfig.scaledHeight(2.0),
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
