import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static String routeName = "loading";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              "Loading",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 4,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
