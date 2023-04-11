import 'package:flutter/material.dart';
import 'package:food_boxes/constants.dart';

import '../screens/reset_pw_screen.dart';
import '../utility/size_config.dart';
import 'auth_screen.dart';

class AcctScreen extends StatefulWidget {
  const AcctScreen({super.key});
  static const String routeName = "acct";

  @override
  State<AcctScreen> createState() => _AcctScreenState();
}

class _AcctScreenState extends State<AcctScreen> {
  final String exampleText = "Josh";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: SizeConfig.safeHeight * 0.03,
              left: SizeConfig.safeWidth * 0.1,
              right: SizeConfig.safeWidth * 0.1,
              bottom: SizeConfig.safeHeight * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: SizeConfig.safeHeight * 0.1,
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.03,
                ),
                TextFormField(
                  initialValue: exampleText,
                  decoration: InputDecoration(
                    label: Text("First Name"),
                    hintText: "First Name",
                    prefixIcon: Icon(Icons.face),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.01,
                ),
                TextFormField(
                  initialValue: exampleText,
                  decoration: InputDecoration(
                    label: Text("Last Name"),
                    hintText: "Last Name",
                    prefixIcon: Icon(Icons.face),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.01,
                ),
                TextFormField(
                  initialValue: "15",
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Age"),
                    hintText: "Age",
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.01,
                ),
                ListTile(
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.of(context).pushNamed(AuthScreen.routeName);
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.01,
                ),
                ListTile(
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: Icon(Icons.key),
                  title: Text("Reset Password"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.of(context).pushNamed(ResetPwScreen.routeName);
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeHeight * 0.01,
                ),
                ListTile(
                  tileColor: Colors.red[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: Icon(Icons.delete_forever),
                  title: Text("Delete Account"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.of(context).pushNamed(AuthScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Tickets",
          ),
        ],
        onTap: (int index) {
          Navigator.of(context).pushNamed(
            Constants.routeNames[index],
          );
        },
      ),
    );
  }
}
