import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utility/home_functions.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  Widget _systemAppropriateAppBar(WidgetRef ref) {
    // if (Platform.isIOS) {
    //   return CupertinoNavigationBar(
    //     middle: Text("Personal Expenses"),
    //     trailing: IconButton(
    //       onPressed: () => addNewTxBottomSheet(ref),
    //       icon: Icon(Icons.add),
    //     ),
    //   );
    // }
    return AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () => addNewTxBottomSheet(ref),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBar = _systemAppropriateAppBar(ref) as AppBar;
    return Scaffold(
      appBar: appBar,
      body: HomeScreen(
        appBarHeight: appBar.preferredSize.height,
      ),
    );
  }
}
