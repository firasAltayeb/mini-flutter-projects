import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodBoxes'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              'Loading...',
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
