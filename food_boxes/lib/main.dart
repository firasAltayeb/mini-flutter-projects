import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'app_constants.dart';
import 'firebase_options.dart';
import 'app_router.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'utility/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.boxName);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    if (!SizeConfig.initialized) SizeConfig.int(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Boxes",
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: SizeConfig.scaledHeight(4),
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.5),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: SizeConfig.scaledHeight(2),
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: AppConstants.circleRadius,
            ),
            minimumSize: Size(30, 30),
          ),
        ),
        listTileTheme: ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 5),
            minimumSize: Size.zero,
          ),
        ),
        iconTheme: IconThemeData(color: AppConstants.grey500),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return LoadingScreen();
          // }
          // hasData refers to whether or not the user is logged in
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return AuthenticationScreen();
        },
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
