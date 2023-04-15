import 'package:flutter/material.dart';

class CstTextFormField extends StatefulWidget {
  const CstTextFormField({
    this.labelFocusColor = Colors.blue,
    this.inputType = TextInputType.text,
    this.hideLabelOnFocus = false,
    this.obscureText = false,
    required this.label,
    this.prefixIconWidget,
    this.errorLabelColor,
    this.maxLines = 1,
    this.initialValue,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSaved;
  final Function(String)? validator;
  final TextInputType inputType;
  final Widget? prefixIconWidget;
  final Color? errorLabelColor;
  final Color labelFocusColor;
  final bool hideLabelOnFocus;
  final String? initialValue;
  final bool obscureText;
  final String label;
  final int maxLines;

  @override
  State<CstTextFormField> createState() => _CstTextFormFieldState();
}

class _CstTextFormFieldState extends State<CstTextFormField> {
  FocusNode focusNode = FocusNode();
  bool _textVisible = true;
  bool _focused = false;

  @override
  void initState() {
    _textVisible = widget.obscureText;
    focusNode.addListener(() {
      setState(() {
        _focused = !_focused;
      });
    });
    super.initState();
  }

  Widget suffixIconWidget() {
    return widget.obscureText
        ? IconButton(
            onPressed: () => setState(() => _textVisible = !_textVisible),
            splashRadius: 0.1,
            icon: !_textVisible
                ? Icon(Icons.visibility, size: 20)
                : Icon(Icons.visibility_off, size: 20),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      onChanged: (val) {
        return widget.onChanged?.call(val);
      },
      onSaved: (val) {
        widget.onSaved?.call(val!);
      },
      validator: (val) {
        return widget.validator?.call(val!);
      },
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        labelText: _focused && widget.hideLabelOnFocus ? null : widget.label,
        labelStyle: TextStyle(
          color: _focused ? widget.labelFocusColor : Colors.grey,
        ),
        errorStyle: TextStyle(
          color: widget.errorLabelColor ?? Colors.red[900],
        ),
        prefixIcon: widget.prefixIconWidget,
        suffixIcon: suffixIconWidget(),
        // isDense: true,
        // filled: true,
      ),
      initialValue: widget.initialValue,
      obscureText: _textVisible,
      maxLines: widget.maxLines,
    );
  }
}
