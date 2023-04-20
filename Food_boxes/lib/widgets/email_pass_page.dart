import 'package:flutter/material.dart';

import '../utility/size_config.dart';
import '../screens/reg_screen.dart';
import 'custom_text_field.dart';

class EmailPasswordPage extends StatefulWidget {
  const EmailPasswordPage({
    required this.passedRouteName,
    required this.titleText,
    required this.subTitle,
    super.key,
  });

  final String passedRouteName;
  final String titleText;
  final String subTitle;

  @override
  State<EmailPasswordPage> createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final String currentRoute;

  void _submitFormData() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(widget.passedRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    currentRoute = ModalRoute.of(context)!.settings.name!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            widget.subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: SizeConfig.safeHeight * 0.04,
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.isEmpty) return "This value must be filled";
              return null;
            },
            prefixIconWidget: Icon(Icons.email),
            label: "Email",
          ),
          SizedBox(
            height: SizeConfig.safeHeight * 0.01,
          ),
          CustomTxtFormField(
            validator: (value) {
              if (value.isEmpty) return "This value must be filled";
              if (currentRoute == RegisterationScreen.routeName &&
                  value.length > 64) {
                return "Password is too long";
              }
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            hideLabelOnFocus: true,
            obscureText: true,
            label: "Password",
          ),
          Container(
            padding: EdgeInsets.only(
              top: SizeConfig.safeHeight * 0.01,
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _submitFormData,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Submit"),
                  SizedBox(
                    width: SizeConfig.safeWidth * 0.01,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
