import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/shared_providers.dart';
import 'splash_screen.dart';

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
      ref.read(initializeMainProviders);
      return SplashScreen();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: AppConstants.menuItemList[pageIndex].bodyBuild,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int idx) => setState(() => pageIndex = idx),
        items: AppConstants.menuItemList
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
