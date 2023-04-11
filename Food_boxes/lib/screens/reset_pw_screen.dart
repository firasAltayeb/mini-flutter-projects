import 'package:flutter/material.dart';

import '../utility/size_config.dart';

class ResetPwScreen extends StatefulWidget {
  const ResetPwScreen({super.key});
  static const String routeName = "reset";

  @override
  State<ResetPwScreen> createState() => _ResetPwScreenState();
}

class _ResetPwScreenState extends State<ResetPwScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: SizeConfig.safeHeight * 0.05,
                left: SizeConfig.safeWidth * 0.1,
                right: SizeConfig.safeWidth * 0.1,
                bottom: SizeConfig.safeHeight * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Please enter your email to proceed",
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
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Submit"), Icon(Icons.arrow_forward_ios_rounded)],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Remembered your Password?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Go back"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
