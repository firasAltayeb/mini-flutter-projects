import 'package:flutter/material.dart';
import 'dart:async';

class AutoHideSnackBar extends StatefulWidget {
  @override
  State<AutoHideSnackBar> createState() {
    return _AutoHideSnackBarState();
  }
}

class _AutoHideSnackBarState extends State<AutoHideSnackBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer? _snackbarTimer;

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Snackbar will be hidden after 5 seconds'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Hide',
          onPressed: _hideSnackbar,
        ),
      ),
    );

    _snackbarTimer = Timer(Duration(seconds: 5), () => _hideSnackbar);
  }

  void _hideSnackbar() {
    if (_snackbarTimer != null && _snackbarTimer!.isActive) {
      _snackbarTimer!.cancel();
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Snackbar Hide Button Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showSnackbar,
          child: Text('Show Snackbar'),
        ),
      ),
    );
  }
}
