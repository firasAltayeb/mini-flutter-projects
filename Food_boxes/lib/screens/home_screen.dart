import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Constants.menuItemlist[pageIndex].bodyBuild,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int idx) => setState(() => pageIndex = idx),
        items: Constants.menuItemlist
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.iconData),
                label: e.labelText,
              ),
            )
            .toList(),
        currentIndex: pageIndex,
      ),
    );
  }
}
