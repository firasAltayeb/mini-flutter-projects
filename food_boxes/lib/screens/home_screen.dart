import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../utility/box_list_notifier.dart';
import '../utility/shared_providers.dart';
import 'loading_screen.dart';

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
        onTap: (index) => setState(() {
          ref.read(selectedBoxesProvider.notifier).clearList();
          pageIndex = index;
        }),
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
