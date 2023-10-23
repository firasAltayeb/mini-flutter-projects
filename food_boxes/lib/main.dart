import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_constants.dart';
import 'firebase_options.dart';
import '../screens/auth_screen.dart';
import '../routes.dart';
import 'screens/home_screen.dart';
import 'utility/size_config.dart';
import 'utility/user_info_box.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(
    AppConstants.boxName,
  );
  UserInfoBox();
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
    if (!SizeConfig.initialized) {
      SizeConfig().int(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Boxes",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: SizeConfig.scaledHeight(5.0),
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.5),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.0),
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
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // print("snapshot is ${snapshot.connectionState}");
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const SplashScreen();
          // }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const AuthenticationScreen();
        },
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
