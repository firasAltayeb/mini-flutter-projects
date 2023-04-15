import 'package:flutter/material.dart';

import '../utility/size_config.dart';
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
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _submitFormData() async {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(widget.passedRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          CstTextFormField(
            validator: (value) {
              String newEmail = _emailController.text;
              if (newEmail.isEmpty) return "This value must be filled";
              return null;
            },
            prefixIconWidget: Icon(Icons.email),
            controller: _emailController,
            label: "Email",
          ),
          SizedBox(
            height: SizeConfig.safeHeight * 0.01,
          ),
          CstTextFormField(
            validator: (value) {
              String newPass = _passwordController.text;
              if (value.isEmpty) return "This value must be filled";
              if (newPass.length > 64) return "Password is too long";
              return null;
            },
            prefixIconWidget: Icon(Icons.lock),
            controller: _passwordController,
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
