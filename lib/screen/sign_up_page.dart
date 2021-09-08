import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/global/reg_exp.dart';
import 'package:quiz/widget/common_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confPass = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 56,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign-Up',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.9,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Form(
                  key: _signUpKey,
                  child: ListView(
                    children: [
                      commonTextFormField(
                        hintText: 'Email',
                        validator: (inputVal) {
                          if (!emailRegex.hasMatch(inputVal.toString()))
                            return 'Email format not Matching';
                          return null;
                        },
                        textEditingController: this.email,
                      ),
                      commonTextFormField(
                        hintText: 'Password',
                        validator: (inputVal) {
                          if (inputVal!.length < 6)
                            return 'password must be more than 6 words';
                          return null;
                        },
                        textEditingController: this.password,
                      ),
                      commonTextFormField(
                        hintText: 'Confirm Password',
                        validator: (inputVal) {
                          if (inputVal!.length < 6)
                            return 'Confirm Password must be at least 6 characters';
                          if (this.password.text != this.confPass.text)
                            return 'Confirm password and Password not same';
                          return null;
                        },
                        textEditingController: this.confPass,
                        //signUpAuthButton(context, 'Sign-Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}