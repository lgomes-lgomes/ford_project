import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class TextFieldComponent extends StatelessWidget {
  TextFieldComponent({
    this.validator,
    this.readOnly,
    this.hint,
    this.suffixIcon,
    this.padding,
    this.margin,
    this.obscureText,
    required this.label,
  });

  String? Function(String?)? validator;
  bool? readOnly;
  String? hint;
  Icon? suffixIcon;
  double? padding;
  EdgeInsets? margin;
  bool? obscureText;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label),
          contentPadding: EdgeInsets.all(padding ?? 8),
          hintText: hint ?? label,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            gapPadding: 100,
          ),
        ),
      ),
    );
  }
}
