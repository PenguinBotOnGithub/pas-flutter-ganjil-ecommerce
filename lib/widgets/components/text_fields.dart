import 'package:flutter/material.dart';
import 'package:flutter_tugas_pas/widgets/components/custom_suffix_icon.dart';
import 'package:flutter_tugas_pas/widgets/constants.dart';

class StyledTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String label;
  final String hint;
  final String svgSuffixIcon;
  final TextEditingController controller;
  final void Function() onTap;
  final void Function(PointerDownEvent?) onTapOutside;

  const StyledTextField(
      {super.key,
      required this.focusNode,
      required this.label,
      required this.hint,
      required this.svgSuffixIcon,
      required this.controller,
      required this.onTap,
      required this.onTapOutside});

  factory StyledTextField.form(
      {required FocusNode focusNode,
      required String label,
      required String hint,
      required String svgSuffixIcon,
      required TextEditingController controller,
      required void Function() onTap,
      required void Function(PointerDownEvent?) onTapOutside}) {
    return _StyledTextFormField(
      focusNode: focusNode,
      label: label,
      hint: hint,
      svgSuffixIcon: svgSuffixIcon,
      controller: controller,
      obscureText: false,
      onTap: onTap,
      onTapOutside: onTapOutside,
    );
  }

  factory StyledTextField.password(
      {required FocusNode focusNode,
      required String label,
      required String hint,
      required String svgSuffixIcon,
      required TextEditingController controller,
      required void Function() onTap,
      required void Function(PointerDownEvent?) onTapOutside}) {
    return _StyledTextFormField(
      focusNode: focusNode,
      label: label,
      hint: hint,
      svgSuffixIcon: svgSuffixIcon,
      controller: controller,
      obscureText: true,
      onTap: onTap,
      onTapOutside: onTapOutside,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onTap: onTap,
      onTapOutside: onTapOutside,
      controller: controller,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: svgSuffixIcon,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        filled: true,
        fillColor: Colors.white, // Ganti warna latar belakang
        contentPadding: EdgeInsets.only(left: 25, right: 25),
      ),
    );
  }
}

class _StyledTextFormField extends StyledTextField {
  final bool obscureText;

  const _StyledTextFormField(
      {required super.focusNode,
      required super.label,
      required super.hint,
      required super.svgSuffixIcon,
      required super.controller,
      required this.obscureText,
      required super.onTap,
      required super.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: super.focusNode,
      onTap: super.onTap,
      onTapOutside: super.onTapOutside,
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: svgSuffixIcon,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), // Border radius 50
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        filled: true,
        fillColor: Colors.white, // Ganti warna latar belakang
        contentPadding: EdgeInsets.only(left: 25, right: 25),
      ),
    );
  }
}
