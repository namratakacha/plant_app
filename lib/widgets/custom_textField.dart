import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors_titles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Widget? icon;
  final String? Function(String?) validator;
  final FocusNode? focusNode;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      this.icon,
      required this.validator, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Constants.primaryColor,
            ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        focusNode: focusNode,
        cursorColor: Constants.primaryColor,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.primaryColor),
                borderRadius: BorderRadius.circular(15)),
            contentPadding: EdgeInsets.only(top: 8),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
