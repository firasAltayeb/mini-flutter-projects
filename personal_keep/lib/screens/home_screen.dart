import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_keep/utility/home_functions.dart';
import 'package:personal_keep/widgets/landscape_page.dart';
import 'package:personal_keep/widgets/portrait_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  AppBar _customAppBar(WidgetRef ref) {
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
    final mediaQuery = MediaQuery.of(context);
    final appBar = _customAppBar(ref);
    final barExcludedScrnHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: mediaQuery.orientation == Orientation.landscape
              ? LandscapePage(screenHeight: barExcludedScrnHeight)
              : PortraitPage(screenHeight: barExcludedScrnHeight),
        ),
      ),
    );
  }
}
