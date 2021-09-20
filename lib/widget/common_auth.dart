import 'package:flutter/material.dart';
import 'package:quiz/screen/log_in_page.dart';
import 'package:quiz/screen/sign_up_page.dart';

Widget commonTextFormField({
  required String hintText,
  required String? Function(String?)? validator,
  required TextEditingController textEditingController,
}) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: TextFormField(
      obscureText: true,
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

Widget switchAnotherAuthScreen(
    BuildContext context, String first, String second) {
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          first,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        Text(
          second,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
            letterSpacing: 1.0,
          ),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      primary: Colors.blue,
    ),
    onPressed: () {
      if (second == 'Log-in') {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LogInScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignUpPage()));
      }
    },
  );
}