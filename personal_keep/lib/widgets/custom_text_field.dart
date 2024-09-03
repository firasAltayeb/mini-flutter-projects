import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTxtFormField extends StatefulWidget {
  const CustomTxtFormField({
    required this.decorationLabel,
    this.errorLabelColor = const Color(0xFFB71C1C),
    this.labelFocusColor = Colors.blue,
    this.keyboardType = TextInputType.text,
    this.hideLabelOnFocus = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.prefixIconWidget,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.controller,
    this.onSaved,
    this.inputFormatters,
    this.autocorrect = false,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? validator;
  final Widget? prefixIconWidget;
  final String? initialValue;
  final Color errorLabelColor;
  final Color labelFocusColor;
  final TextInputType keyboardType;
  final bool hideLabelOnFocus;
  final bool obscureText;
  final String decorationLabel;
  final int maxLines;
  final bool autocorrect;
  final TextCapitalization textCapitalization;

  @override
  State<CustomTxtFormField> createState() => _CustomTxtFormFieldState();
}

class _CustomTxtFormFieldState extends State<CustomTxtFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _textVisible = true;
  bool _focused = false;

  @override
  void initState() {
    _textVisible = widget.obscureText;
    _focusNode.addListener(() {
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
            icon: _textVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (value) {
        return widget.onChanged?.call(value);
      },
      onSaved: (value) {
        if (value != null) return widget.onSaved?.call(value);
      },
      validator: (value) {
        if (value != null) return widget.validator?.call(value);
        return null;
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText:
            _focused && widget.hideLabelOnFocus ? null : widget.decorationLabel,
        labelStyle: TextStyle(
          color: _focused ? widget.labelFocusColor : Colors.grey[500],
        ),
        errorStyle: TextStyle(
          color: widget.errorLabelColor,
        ),
        prefixIcon: widget.prefixIconWidget,
        suffixIcon: suffixIconWidget(),
      ),
      initialValue: widget.initialValue,
      obscureText: _textVisible,
      maxLines: widget.maxLines,
    );
  }
}
