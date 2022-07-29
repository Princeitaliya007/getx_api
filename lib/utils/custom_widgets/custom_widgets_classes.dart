import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.style,
    this.prefixIcon,
    required this.controller,
    this.borderColor,
    this.textInputAction,
    this.keyboardType,
    this.textStyle,
    this.filledColor,
    this.enabled,
    this.focusNode,
    this.validator,
    this.icon,
    this.label,
    this.onChanged,
    this.suffixicon,
    required this.obscuretext,
  }) : super(key: key);
  final Key? fieldKey;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? textStyle;
  final Widget? label;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onChanged;
  final Color? borderColor;
  final Icon? icon;
  final Widget? suffixicon;
  final bool obscuretext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: (val) {},
      controller: controller,
      style: style,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        icon: icon,
        label: label,
        hintText: hintText,
      ),
      obscureText: obscuretext,
    );
  }
}
