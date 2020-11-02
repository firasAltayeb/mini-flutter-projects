import 'package:Personal_keep/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = {
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 120.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Sex toys',
      amount: 69.99,
      date: DateTime.now(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text('Chart!'),
              ),
              elevation: 5,
            ),
            Card(
              color: Colors.red,
              child: Text('List of TX'),
            ),
          ],
        ));
  }
}
