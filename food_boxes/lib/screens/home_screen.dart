import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/screens/loading_screen.dart';
import 'package:food_boxes/utility/shared_providers.dart';

import '../app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "/";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(appProvidersInitialized) == false) {
      ref.read(intializeMainProviders);
      return LoadingScreen();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppConstants.menuItemList[pageIndex].bodyBuild,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => pageIndex = index),
        items: AppConstants.menuItemList
            .map(
              (e) => BottomNavigationBarItem(
                label: e.labelText,
                icon: Icon(e.iconData),
              ),
            )
            .toList(),
        currentIndex: pageIndex,
      ),
    );
  }
}
