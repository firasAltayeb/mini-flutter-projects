import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_boxes/routes.dart';
import 'package:food_boxes/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
      initialRoute: AuthenticationScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}
