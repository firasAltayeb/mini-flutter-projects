import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTxtFormField extends StatefulWidget {
  const CustomTxtFormField({
    this.errorLabelColor = const Color(0xFFB71C1C),
    this.labelFocusColor = Colors.blue,
    this.keyboardType = TextInputType.text,
    this.hideLabelOnFocus = false,
    this.obscureText = false,
    this.prefixIconWidget,
    this.inputFormatters,
    this.maxLines = 1,
    this.controller,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.onSaved,
    required this.decorationLabel,
    Key? key,
  }) : super(key: key);

  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSaved;
  final Function(String)? validator;
  final TextInputType keyboardType;
  final Widget? prefixIconWidget;
  final String? initialValue;
  final Color errorLabelColor;
  final Color labelFocusColor;
  final bool hideLabelOnFocus;
  final bool obscureText;
  final String decorationLabel;
  final int maxLines;

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
            icon: !_textVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: (val) {
        return widget.onChanged?.call(val);
      },
      onSaved: (val) {
        if (val != null) widget.onSaved?.call(val);
      },
      validator: (val) {
        if (val != null) return widget.validator?.call(val);
        return null;
      },
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText:
            _focused && widget.hideLabelOnFocus ? null : widget.decorationLabel,
        labelStyle: TextStyle(
          color: _focused ? widget.labelFocusColor : Colors.grey,
        ),
        errorStyle: TextStyle(
          color: widget.errorLabelColor,
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
