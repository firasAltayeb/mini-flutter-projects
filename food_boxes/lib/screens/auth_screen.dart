import 'package:flutter/material.dart';

import '../utility/size_config.dart';
import '../widgets/email_pw_page.dart';
import 'reg_screen.dart';
import 'reset_pw_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});
  static const String routeName = "auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: SizeConfig.safeWidth,
        height: SizeConfig.safeHeight,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(10),
          horizontal: SizeConfig.scaledWidth(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Add unfocus feature
            EmailPasswordPage(
              titleText: "Login",
              subtitle: "Please sign in to proceed",
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.safeWidth,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: SizeConfig.scaledHeight(2),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RegisterationScreen.routeName);
                  },
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: SizeConfig.scaledHeight(2),
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
