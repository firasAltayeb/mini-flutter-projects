import 'package:flutter/material.dart';

import '../widgets/email_pass_page.dart';
import '../screens/reset_pw_screen.dart';
import '../screens/home_screen.dart';
import '../utility/size_config.dart';
import '../screens/reg_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = "auth";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void didChangeDependencies() {
    if (!SizeConfig.initlized) SizeConfig().int(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: SizeConfig.safeWidth,
        height: SizeConfig.safeHeight,
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeHeight * 0.1,
          horizontal: SizeConfig.safeWidth * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailPasswordPage(
              passedRouteName: HomeScreen.routeName,
              subTitle: "Please sign in to proceed",
              titleText: "Login",
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.of(ctx).pushNamed(ResetPwScreen.routeName),
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.safeWidth,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Theme.of(ctx).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?",
                  style: Theme.of(ctx).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pushNamed(RegScreen.routeName);
                  },
                  child: Text("Create an Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
