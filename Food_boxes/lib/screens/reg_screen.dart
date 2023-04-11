import 'package:flutter/material.dart';

import '../utility/size_config.dart';
import 'auth_screen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});
  static const String routeName = "reg";

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: SizeConfig.safeHeight * 0.1,
            left: SizeConfig.safeWidth * 0.1,
            right: SizeConfig.safeWidth * 0.1,
            bottom: SizeConfig.safeHeight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Please sign up to proceed",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: SizeConfig.safeHeight * 0.05,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeHeight * 0.01,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Register"),
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
                  "Already have an Account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AuthScreen.routeName);
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
