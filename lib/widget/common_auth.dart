import 'package:flutter/material.dart';

Widget commonTextFormField({
  required String hintText,
  required String? Function(String?)? validator,
  required TextEditingController textEditingController,
}) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: TextFormField(
      validator: validator,
      controller: textEditingController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}