import 'package:flutter/material.dart';

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
  bool _hidePassword = true;

  @override
  void didChangeDependencies() {
    if (!SizeConfig.initlized) SizeConfig().int(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: SizeConfig.safeWidth,
        height: SizeConfig.safeHeight,
        padding: EdgeInsets.only(
          top: SizeConfig.safeHeight * 0.1,
          left: SizeConfig.safeWidth * 0.1,
          right: SizeConfig.safeWidth * 0.1,
          bottom: SizeConfig.safeHeight * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Please sign in to proceed",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: SizeConfig.safeHeight * 0.05,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeHeight * 0.01,
            ),
            TextFormField(
              obscureText: _hidePassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: _hidePassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        _hidePassword = !_hidePassword;
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Login"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ResetPwScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: SizeConfig.safeWidth,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 12,
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
                    Navigator.of(context).pushNamed(RegScreen.routeName);
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
