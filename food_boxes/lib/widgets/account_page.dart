import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../screens/auth_screen.dart';
import '../screens/reset_pw_screen.dart';
import '../utility/shared_functions.dart';
import '../utility/size_config.dart';
import '../utility/user_info_box.dart';
import 'custom_text_field.dart';

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

  @override
  void initState() {
    _firstNameController.text = UserInfoBox.getFirstName();
    _lastNameController.text = UserInfoBox.getLastName();
    _ageController.text = "${UserInfoBox.getAge()}";
    super.initState();
  }

  void _submitFormData() {
    if (_formKey.currentState!.validate()) {
      UserInfoBox.setFirstName(_firstNameController.text);
      UserInfoBox.setLastName(_lastNameController.text);
      UserInfoBox.setAge(_ageController.text);
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
              SizedBox(
                height: SizeConfig.scaledHeight(1),
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
              SizedBox(
                height: SizeConfig.scaledHeight(1),
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
              SizedBox(
                height: SizeConfig.scaledHeight(1),
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
                      Icons.clear_rounded,
                      "Clear",
                      () {
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _ageController.clear();
                      },
                    ),
                    smallListTile(
                      Icons.save,
                      "Save",
                      _submitFormData,
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
                  UserInfoBox.setUserId("");
                  Navigator.of(context)
                      .pushReplacementNamed(AuthenticationScreen.routeName);
                },
              ),
              SizedBox(
                height: SizeConfig.scaledHeight(1),
              ),
              ListTile(
                tileColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circleRadius,
                ),
                leading: Icon(Icons.key),
                title: Text("Reset Password"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen.routeName);
                },
              ),
              SizedBox(
                height: SizeConfig.scaledHeight(1),
              ),
              ListTile(
                tileColor: Colors.red[700],
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circleRadius,
                ),
                leading: Icon(Icons.delete_forever),
                title: Text("Delete Account"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  //TODO: delete user account based on dialog
                  yesNoDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector smallListTile(
      IconData icon, String text, void Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: SizeConfig.scaledHeight(7),
        width: SizeConfig.scaledWidth(39),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: SizeConfig.scaledWidth(4),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.scaledHeight(2.25),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
