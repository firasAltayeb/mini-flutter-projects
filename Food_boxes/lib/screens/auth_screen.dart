import 'package:flutter/material.dart';
import 'package:food_boxes/screens/home_screen.dart';
import 'package:food_boxes/screens/reg_screen.dart';
import 'package:food_boxes/screens/reset_pw_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = "reg";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              bottom: scrnSize.height * 0.01,
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
                    suffixIcon: IconButton(
                      icon: Icon(Icons.question_mark),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ResetPwScreen.routeName);
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Login"), Icon(Icons.arrow_forward_ios_rounded)],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ResetPwScreen.routeName);
            },
            child: Text("Forgot Password"),
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
          )
        ],
      ),
    );
  }
}
