import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../screens/auth_screen.dart';
import '../screens/reset_pw_screen.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';
import 'custom_text_field.dart';
import 'small_list_tile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  void getUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    _firstNameController.text = userData.data()?['firstName'] ?? '';
    _lastNameController.text = userData.data()?['lastName'] ?? '';
    _ageController.text = userData.data()?['age'] ?? '';
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void _submitFormData() async {
    if (_formKey.currentState!.validate() == false) return;
    //TODO: use riverpod to store user details
    final user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'age': _ageController.text,
    });
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        messegeSnackBar("User data has been updated", timeUp: 1000),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(10),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(2),
                ),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: SizeConfig.scaledHeight(10),
                ),
              ),
              CustomTxtFormField(
                controller: _firstNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your first name.";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                prefixIconWidget: Icon(Icons.face),
                decorationLabel: "First Name",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(1),
                ),
                child: CustomTxtFormField(
                  controller: _lastNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your last name.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  prefixIconWidget: Icon(Icons.face),
                  decorationLabel: "Last Name",
                ),
              ),
              CustomTxtFormField(
                controller: _ageController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your age.";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                prefixIconWidget: Icon(Icons.numbers),
                decorationLabel: "Age",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallListTile(
                      icon: Icons.clear_rounded,
                      text: "Clear",
                      function: () {
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _ageController.clear();
                      },
                    ),
                    smallListTile(
                      icon: Icons.save,
                      text: "Save",
                      function: _submitFormData,
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circleRadius,
                ),
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.scaledHeight(1),
                ),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.circleRadius,
                  ),
                  leading: Icon(Icons.key),
                  title: Text("Reset Password"),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ResetPasswordScreen.routeName);
                  },
                ),
              ),
              ListTile(
                tileColor: Colors.red[700],
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circleRadius,
                ),
                leading: Icon(Icons.delete_forever),
                title: Text("Delete Account"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () async {
                  bool? value = await yesNoDialog(
                        context,
                        "Deleting your account is permanent and irreversible",
                      ) ??
                      false;
                  if (value) {
                    try {
                      await FirebaseAuth.instance.currentUser?.delete();
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed(
                            AuthenticationScreen.routeName);
                      }
                    } on FirebaseAuthException catch (e) {
                      print('Failed with error code: ${e.code}');
                      String snackBarMsg;
                      if (e.code == 'requires-recent-login') {
                        snackBarMsg = 'Recent login is required. '
                            'Please logout and log back in.';
                      } else {
                        snackBarMsg = e.message!;
                      }
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          messegeSnackBar(snackBarMsg, timeUp: 2000),
                        );
                      }
                    } catch (e) {
                      print("Caught exception: $e");
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
