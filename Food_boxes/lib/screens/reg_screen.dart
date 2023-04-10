import 'package:flutter/material.dart';

import 'auth_screen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});
  static const String routeName = "auth";

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    final scrnSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: scrnSize.height * 0.1,
                left: scrnSize.width * 0.1,
                right: scrnSize.width * 0.1,
                bottom: scrnSize.height * 0.01),
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
                  height: scrnSize.height * 0.05,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
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
          )
        ],
      ),
    );
  }
}
