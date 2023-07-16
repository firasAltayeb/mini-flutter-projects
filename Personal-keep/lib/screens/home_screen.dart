import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../utility/home_functions.dart';
import '../models/transaction.dart';
import '../constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _deleteTransaction(String id) {
    setState(() {
      Constants.userTransations.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = systemAppropriateAppBar(
      context: context,
      changeHandler: (Transaction newTx) {
        setState(() {
          Constants.userTransations.add(newTx);
        });
      },
    );

    final barExcludedScrnHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...orientationAppropriateBody(
              changeState: (val) => setState(() => _showChart = val),
              mediaQuery: MediaQuery.of(context),
              scrnHeight: barExcludedScrnHeight,
              deleteTx: _deleteTransaction,
              showChart: _showChart,
            ),
          ],
        ),
      ),
    );

    if (Platform.isIOS)
      return CupertinoPageScaffold(
        navigationBar: appBar,
        child: pageBody,
      );
    else
      return Scaffold(
        appBar: appBar,
        body: pageBody,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => addNewTransactionBttmSht(
            changeState: (Transaction newTx) {
              setState(() => Constants.userTransations.add(newTx));
            },
            ctx: context,
          ),
        ),
      );
  }
}
