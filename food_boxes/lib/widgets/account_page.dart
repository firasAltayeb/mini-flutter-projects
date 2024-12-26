import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../screens/reset_pw_screen.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_functions.dart';
import '../utility/shared_providers.dart';
import 'custom_txt_field.dart';
import 'small_list_tile.dart';
import 'text_check_box.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = ref.read(firstNameProvider);
    _lastNameController.text = ref.read(lastNameProvider);
    _ageController.text = ref.read(ageProvider);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      final userID = ref.read(userIDProvider);
      final data = {
        "firstName": _firstNameController.text,
        "lastName": _lastNameController.text,
        "age": _ageController.text,
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .set(data);
      updateProviders(ref, data: data);
      FocusManager.instance.primaryFocus?.unfocus();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(context, "User data has been updated", timeUp: 1000),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hideLogoutDialogue = ref.watch(logoutToggleProvider);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.percentWidth(10),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.percentHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.percentHeight(2),
                ),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: context.percentHeight(10),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.percentHeight(2),
                ),
                child: CustomTxtFormField(
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
              ),
              CustomTxtFormField(
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.percentHeight(2),
                ),
                child: CustomTxtFormField(
                  controller: _ageController,
                  validator: (value) {
                    if (value.trim().length > 3 || value.isEmpty) {
                      return "Please enter an accurate age.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  prefixIconWidget: Icon(Icons.numbers),
                  decorationLabel: "Age",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.percentHeight(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallListTile(
                        icon: Icons.clear_rounded,
                        text: "Clear",
                        function: () {
                          _firstNameController.clear();
                          _lastNameController.clear();
                          _ageController.clear();
                        }),
                    SmallListTile(
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
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: context.percentHeight(2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: context.percentHeight(2),
                ),
                onTap: () async {
                  bool confirmLogout = true;
                  if (!hideLogoutDialogue) {
                    confirmLogout = await yesNoDialogue(
                            context,
                            "You will have to log back in with your username and password.",
                            TextCheckBox(provider: logoutToggleProvider)) ??
                        false;
                  }
                  if (confirmLogout) {
                    FirebaseAuth.instance.signOut();
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.percentHeight(2),
                ),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppConstants.circleRadius,
                  ),
                  leading: Icon(Icons.key),
                  title: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: context.percentHeight(2),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: context.percentHeight(2),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ResetPasswordScreen.routeName);
                  },
                ),
              ),
              ListTile(
                tileColor: Colors.red[700],
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circleRadius,
                ),
                leading: Icon(Icons.delete_forever),
                title: Text(
                  "Delete Account",
                  style: TextStyle(
                    fontSize: context.percentHeight(2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: context.percentHeight(2),
                ),
                onTap: () => deleteAccount(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
